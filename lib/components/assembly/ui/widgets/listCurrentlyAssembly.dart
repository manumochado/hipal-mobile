import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/historyAssembly/historyAssembly_bloc.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/assembly/ui/screens/welcome_assembly.dart';
import 'package:hipal/components/assembly/ui/widgets/callAssembly.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CurrentlyAssemblyList extends StatefulWidget {
  @override
  _CurrentlyAssemblyList createState() => _CurrentlyAssemblyList();
}

class _CurrentlyAssemblyList extends State<CurrentlyAssemblyList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<CurrentlyAssembly> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentlyAssemblyBloc, CurrentlyAssemblyState>(
        builder: (context, state) {
      items =
          (state.currentlyAssemblies != null ? state.currentlyAssemblies : [])!;

      return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Color(0xFFF9FAFE),
        ),
        child: items.length == 0
            ? Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 40,
                child: CircularProgressIndicator(
                  color: const Color(0xff6456EB),
                ),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                onRefresh: () async {
                  BlocProvider.of<HistoryAssemblyBloc>(context)
                      .add(LoadRefreshHistoryAssembly(context));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  BlocProvider.of<HistoryAssemblyBloc>(context)
                      .add(LoadRefreshHistoryAssembly(context));
                  await Future.delayed(Duration(milliseconds: 1000));
                  _refreshController.loadComplete();
                },
                child: items.length > 0
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (c, i) => _familyCard(i),
                        itemCount: items.length,
                        // ],
                      )
                    : Container(),
              ),
      );
    });
  }

  Widget _familyCard(int i) {
    return BlocBuilder<HistoryAssemblyBloc, HistoryAssemblyState>(
        builder: (context, state) {
      List<String> days = [
        'Lunes',
        'Martes',
        'Miercoles',
        'Jueves',
        'Viernes',
        'Sabado',
        'Domingo'
      ];
      List<String> arrMonth = [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ];
      DateFormat dateFormat = DateFormat('HH:mm');
      if (i <= items.length - 1) {
        //var type = items[i]. != null ? items[i].type!.name.toString() : '';

        return Card(
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xffE3DFF8),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
              child: Image.asset('assets/images/logoMeeting.png'),
            ),
            title: Text(
              items[i].nameAssembly != null
                  ? items[i].nameAssembly.toString()
                  : '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              items[i].startDate != null
                  ? '${arrMonth[items[i].startDate!.month - 1]} ${items[i].startDate!.day} , '
                      '${days[items[i].startDate!.weekday - 1]} - ${DateFormat.jm().format(dateFormat.parse(items[i].hour as String))},'
                  : '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xff5C5D87)),
            ),
            trailing: PopupMenuButton(
                icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC)),
                offset: Offset(-25, 18),
                onSelected: (optionValue) => {
                      if (optionValue == 0)
                        {
                         
                        }
                      else if (optionValue == 1)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallAssembly(i)),
                          )
                        }
                    },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                          child: Text('Ingresar a \nla asamble'), value: 0),
                      const PopupMenuItem(
                          child: Text('ver \nconvocatoria'), value: 1),
                    ]),
            onTap: () => {},
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
