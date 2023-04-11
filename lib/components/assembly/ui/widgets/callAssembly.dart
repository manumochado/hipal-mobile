import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/model/uploadOrder.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CallAssembly extends StatefulWidget {
  int i;
  CallAssembly(this.i, {Key? key}) : super(key: key);

  @override
  State<CallAssembly> createState() => _CallAssemblyState(i);
}

class _CallAssemblyState extends State<CallAssembly> {
  int i;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  _CallAssemblyState(this.i);
  List<UploadOrder> items = [];
  @override
  void initState() {
    BlocProvider.of<CurrentlyAssemblyBloc>(context)
        .add(LoadRefreshCurrentlyAssembly(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentlyAssemblyBloc, CurrentlyAssemblyState>(
      builder: (context, state) {
        items = (state.currentlyAssemblies![i].uploadOrder != null
            ? state.currentlyAssemblies![i].uploadOrder?.toList()
            : [])!;

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
        return Scaffold(
          appBar: AppBarBackSearch(
            color_buttons: 0xFFFFFFFF,
            color_title: 0xFFFFFFFF,
            name_title: 'Convocatoria',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'callsAndMeeting',
          ),
          body: Container(
            margin: EdgeInsets.only(top: 50, right: 30, left: 30),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.currentlyAssemblies![i].nameAssembly.toString(),
                      style: TextStyle(
                          color: Color(0xff897EFD),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      state.currentlyAssemblies![i].startDate != null ||
                              state.currentlyAssemblies![i].nameAssembly != null
                          ? 'Tal como lo establecen las disposiciones de nuestro Estatuto Social, '
                              'se CONVOCA A ${state.currentlyAssemblies![i].nameAssembly} para el día '
                              '${state.currentlyAssemblies![i].startDate!.day} de ${arrMonth[state.currentlyAssemblies![i].startDate!.weekday - 1]} '
                              'de ${state.currentlyAssemblies![i].startDate!.year}, a las '
                              '${DateFormat.jm().format(dateFormat.parse(state.currentlyAssemblies![i].hour as String))},'
                              ' en ${state.currentlyAssemblies![i].apartment!.tower!.residential!.name}.'
                          : '',
                      style: TextStyle(color: Color(0xff6C7192), fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Orden del día.',
                      style: TextStyle(
                          color: Color(0xff343887),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'En el siguiente documento adjunto encontrarás toda la información sobre '
                      'el orden del día y los puntos a tratar durante nuestra Asamblea.',
                      style: TextStyle(
                          color: Color(0xff6C7192),
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                items.length == 0
                    ? Container(
                        margin: EdgeInsets.only(top: 400),
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
                          BlocProvider.of<CurrentlyAssemblyBloc>(context)
                              .add(LoadRefreshCurrentlyAssembly(context));
                          await Future.delayed(Duration(milliseconds: 1000));
                          _refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          BlocProvider.of<CurrentlyAssemblyBloc>(context)
                              .add(LoadRefreshCurrentlyAssembly(context));
                          await Future.delayed(Duration(milliseconds: 1000));
                          _refreshController.loadComplete();
                        },
                        child: items.length > 0
                            ? Container(
                                margin: EdgeInsets.only(top: 250),
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (c, i) => _upLoadOrderdCard(i),
                                  itemCount: items.length,
                                ),
                              )
                            : Container(),
                      ),
              ],
            ),
          ),
          extendBody: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    );
  }

  Widget _upLoadOrderdCard(int i) {
    if (i <= items.length - 1) {
      DateTime? date = items[i].createdAt;

      return Card(
        color: Color(0xffF2F0FA),
        child: ListTile(
          leading: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Image.asset('assets/images/logoPDF.png'),
          ),
          title: Text(
            'name Document in procces back',
            style: TextStyle(
                color: Color(0xff343887),
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              items[i].createdAt != null
                  ? '${date?.year.toString()}/${date?.month.toString()}/${date?.day.toString()}'
                  : '',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Color(0xff9FA7B8)),
            ),
          ),
          onTap: () => {},
          trailing: IconButton(
              onPressed: () => {
                    // ignore: deprecated_member_use
                    launch(items[i].url != null ? items[i].url.toString() : '')
                  },
              icon: Image.asset('assets/images/dowloadDocument.png')),
        ),
      );
    } else {
      return Container();
    }
  }
}
