import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/attentionResident/bloc/directoryCollaborator_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/directoryCollaboratorModel.dart';

class AttentionResisdent extends StatefulWidget {
  AttentionResisdent({Key? key}) : super(key: key);

  @override
  State<AttentionResisdent> createState() => _AttentionResisdentState();
}

class _AttentionResisdentState extends State<AttentionResisdent> {
  @override
  void initState() {
    BlocProvider.of<DirectoryCollaboratorBloc>(context)
        .add(LoadSchedueleResident(context));
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Schedule> items = [];
  List<Time> itemsScheduele = [];
  bool loadFinished = false;
  @override
  Widget build(BuildContext context) {
    try {
      Timer(const Duration(seconds: 5), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<DirectoryCollaboratorBloc, ResidentState>(
      builder: (context, state) {
        items = state.resident?.schedule ?? [];
        return Scaffold(
          appBar: AppBarBackSearch(
            color_buttons: 0xFFFFFFFF,
            color_title: 0xFFFFFFFF,
            name_title: 'Atención al residente',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'dashboard',
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment(0, 2.0),
                      colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Horarios de Administración',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xffFFFFFF),
                              fontSize: 13),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          ),
                          child: _infoUser()),
                      //_infoUser()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 130),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Color(0xFFF9FAFE),
                  ),
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: items.length > 0,
                    controller: _refreshController,
                    onRefresh: () async {
                      items.length > 0
                          ? BlocProvider.of<DirectoryCollaboratorBloc>(context)
                              .add(LoadRefreshSchedueleResident(context))
                          : BlocProvider.of<DirectoryCollaboratorBloc>(context)
                              .add(LoadSchedueleResident(context));
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController.refreshCompleted();
                    },
                    onLoading: () async {
                      BlocProvider.of<DirectoryCollaboratorBloc>(context)
                          .add(LoadRefreshSchedueleResident(context));
                      await Future.delayed(Duration(milliseconds: 1000));
                      _refreshController.loadComplete();
                    },
                    child: items.length > 0
                        ? Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (c, i) => _SchedueleCard(i),
                              itemCount: state.resident?.schedule?.length,
                              // ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 50),
                            alignment: Alignment.center,
                            child: !loadFinished
                                ? CircularProgressIndicator(
                                    color: const Color(0xff6456EB),
                                  )
                                : Text(
                                    "No hay un horario para mostrar",
                                    style: TextStyle(
                                      color: Color(0xff6456EB),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    ));
  }

  Widget _infoUser() {
    return BlocBuilder<DirectoryCollaboratorBloc, ResidentState>(
        builder: (context, state) {
      return Container(
        child: state.resident != null
            ? ListTile(
                leading: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: (state.resident?.photo?.url != "" &&
                                  state.resident?.photo?.url != null)
                              ? NetworkImage(
                                  state.resident!.photo!.url.toString())
                              : AssetImage('assets/images/image-default.png')
                                  as ImageProvider,
                        ))),
                title: state.resident?.name != null
                    ? Text(
                        '${state.resident!.name} ${state.resident?.lastName ?? ''}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                            fontSize: 13),
                      )
                    : null,
                subtitle: Text(
                  state.resident != null
                      ? 'Administrador ${state.resident!.residential?.name ?? ''}'
                      : '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                      fontSize: 13),
                ),
              )
            : Text(
                '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                    fontSize: 13),
              ),
      );
    });
  }

  Widget _SchedueleCard(i) {
    return BlocBuilder<DirectoryCollaboratorBloc, ResidentState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        itemsScheduele =
            (items[i].times != null ? items[i].times?.toList() : [])!;
        return Card(
            child: Column(
          children: [
            ListTile(
                leading: Text(
                  items[i].day != null ? items[i].day.toString() : '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff8378FC)),
                ),
                title: itemsScheduele.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (c, j) => Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF7F7FB),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading:
                                Image.asset('assets/images/timeScheduele.png'),
                            title: Row(
                              children: [
                                Text(
                                  itemsScheduele[j].start != null
                                      ? DateFormat.jm()
                                          .format(DateFormat('HH:mm').parse(
                                              itemsScheduele[j]
                                                  .start
                                                  .toString()))
                                          .toString()
                                      : '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(0xff5C5D87)),
                                ),
                                Text(
                                  '  -  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff5C5D87)),
                                ),
                                Text(
                                  itemsScheduele[j].end != null
                                      ? DateFormat.jm()
                                          .format(DateFormat('HH:mm').parse(
                                              itemsScheduele[j].end.toString()))
                                          .toString()
                                      : '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(0xff5C5D87)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: itemsScheduele.length,
                        // ],
                      )
                    : Container()),
            BorderLine(3, 10, 10, 0xffF0F0F7)
          ],
        ));
      } else {
        return Container();
      }
    });
  }
}
