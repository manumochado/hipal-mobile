import 'dart:async';

import 'package:hipal/components/visitors/bloc/formvisit_bloc.dart';
import 'package:hipal/components/visitors/bloc/visitors_bloc.dart';
import 'package:hipal/components/visitors/model/visit.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VisitorsList extends StatefulWidget {
  @override
  createState() => _VisitorsList();
}

class _VisitorsList extends State<VisitorsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Visit> items = [];
  bool loadFinished = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitorsBloc, VisitorsState>(builder: (context, state) {
      items = (state.visitors != null ? state.visitors : [])!;
      Timer(const Duration(seconds: 10), () {
        try {
          setState(() {
            loadFinished = true;
          });
        } catch (e) {}
      });
      if (items.length == 0) {
        return Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          height: 40,
          child: !loadFinished
              ? CircularProgressIndicator(
                  color: const Color(0xff6456EB),
                )
              : Text("No hay información para mostrar",
                  style: TextStyle(
                      color: Color(0xff6456EB),
                      fontSize: 19,
                      fontWeight: FontWeight.w400)),
        );
      } else {
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<VisitorsBloc>(context)
                .add(LoadRefreshVisitors(context));
            await Future.delayed(Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<VisitorsBloc>(context)
                .add(LoadMoreVisitors(context));
            await Future.delayed(Duration(milliseconds: 1000));
            _refreshController.loadComplete();
          },
          child: items.length > 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (c, i) => _visitorsCard(i),
                  itemCount: items.length,
                  // ],
                )
              : Container(),
        );
      }
    });
  }

  Widget _visitorsCard(int i) {
    return BlocBuilder<VisitorsBloc, VisitorsState>(builder: (context, state) {
      if (i <= items.length - 1) {
        List<String> arrMonth = [
          'En',
          'Feb',
          'Mar',
          'Abr',
          'May',
          'Jun',
          'Jul',
          'Agt',
          'Sep',
          'Oct',
          'Nov',
          'Dic'
        ];
        List<String> arrDate = items[i].date.toString().split('-');
        List<String> arrDay = arrDate[2].split(' ');

        DateFormat dateFormat = DateFormat('HH:mm');
        DateTime dateTime = dateFormat.parse(items[i].hour.toString());
        List<String> arrHour =
            DateFormat.jm().format(dateTime).toString().split(' ');

        return Card(
          margin: EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Row(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 17),
                child: (items[i].image == null || items[i].image == '')
                    ? Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff6456EB),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      )
                    : Container(
                        width: 60.0,
                        height: 60.0,
                        //margin: EdgeInsets.only(right: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xff6456EB),
                          image: DecorationImage(
                            image: NetworkImage(items[i].image!.url != null
                                ? items[i].image!.url.toString()
                                : ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[i].fullName != null
                          ? items[i].fullName.toString()
                          : '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff343887)),
                    ),
                    Container(
                      height: 20,
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 233, 255, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        items[i].typeVisit != null
                            ? items[i].typeVisit.toString()
                            : '',
                        style: TextStyle(color: Color(0xff8378FC)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        arrDay[0].toString(),
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            height: 1.7),
                      ),
                      Text(
                        arrMonth[int.parse(arrDate[1]) - 1].toString(),
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13.0,
                            height: 1.7),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset('assets/images/separador.png'),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        arrHour[0].toString(),
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            height: 1.7),
                      ),
                      Text(
                        arrHour[1].toString(),
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13.0,
                            height: 1.7),
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                      color: Color(0xff8378FC)),
                  offset: Offset(-25, 18),
                  onSelected: (optionValue) => {
                        if (optionValue == 1)
                          {_deleteVisitor(context, items[i].id.toString())}
                        else if (optionValue == 0)
                          {
                            BlocProvider.of<FormvisitBloc>(context)
                                .add(EditVisit(context, items[i])),
                            BlocProvider.of<VisitorsBloc>(context)
                                .add(ChangeIndex(1))
                          }
                      },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(child: Text('Editar'), value: 0),
                        const PopupMenuItem(child: Text('Eliminar'), value: 1),
                      ]),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  void _deleteVisitor(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el visitante?'),
            actions: [
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<VisitorsBloc>(context)
                        .add(DeleteVisitors(context, id));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
