import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../utils/general.dart';
import '../../../../widgets/card_image.dart';
import '../../model/reservations.dart';
import 'form_reservation.dart';

class MyReservationsScreen extends StatefulWidget {
  @override
  createState() => _MyReservationsScreen();
}

class _MyReservationsScreen extends State<MyReservationsScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Reservations> items = [];
  String id_user = "";
  List<String> months = [
    "ENE",
    "FEB",
    "MAR",
    "ABR",
    "MAY",
    "JUN",
    "JUL",
    "AGO",
    "SEP",
    "OCT",
    "NOV",
    "DIC"
  ];
  bool loadFinished = false;
  late CommonZonesBloc commonZoneBloc;
  @override
  void initState() {
    // TODO: implement initState
    commonZoneBloc = BlocProvider.of<CommonZonesBloc>(context);
    BlocProvider.of<CommonZonesBloc>(context).add(ResetForm(context));
    super.initState();
    try {
      if (BlocProvider.of<UserBloc>(context).state.userInfo?.user != null) {
        id_user = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo!
            .user!
            .id
            .toString();
      }
    } catch (e) {}
    BlocProvider.of<CommonZonesBloc>(context)
        .add(LoadRefreshReservation(context, id_user, true));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "common-zones");
          return Future.value(true);
        },
        child: Scaffold(
            appBar: AppBarBackSearch(
              color_buttons: 0xFFFFFFFF,
              color_title: 0xFFFFFFFF,
              name_title: 'Mis reservas',
              color_background: 0xFF6456EB,
              with_search: false,
              view: 'common-zones',
            ),
            body: BlocBuilder<CommonZonesBloc, CommonZonesState>(
                builder: (context, state) {
              return state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: const Color(0xff6456EB),
                    ))
                  : Stack(
                      children: [
                        _infoHead(),
                        _widgetBody(),
                      ],
                    );
            })));
  }

  Widget _infoHead() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          begin: Alignment.center,
          end: Alignment(0, 1.5),
          colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
        ),
      ),
      child: Center(
          child: Column(
        children: [
          CardImage(
            colorTitle: 0xFFFFFFFF,
            colorDescription: 0xFFFFFFFF,
            isHome: false,
          )
        ],
      )),
    );
  }

  Widget _widgetBody() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      items = (state.reservations != null ? state.reservations : [])!;
      return Container(
          margin: EdgeInsets.only(top: 110),
          padding: EdgeInsets.only(top: 27, left: 15, right: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 230,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () async {
                BlocProvider.of<CommonZonesBloc>(context)
                    .add(LoadRefreshReservation(context, id_user, true));
                await Future.delayed(Duration(milliseconds: 1000));
                // if failed,use refreshFailed()
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                BlocProvider.of<CommonZonesBloc>(context)
                    .add(LoadRefreshReservation(context, id_user, false));
                await Future.delayed(Duration(milliseconds: 1000));
                // if failed,use refreshFailed()
                _refreshController.refreshCompleted();
                _refreshController.loadComplete();
              },
              child: items.length > 0
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, i) => _reservationsCard(i),
                      itemCount: items.length,
                      // ],
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      height: 40,
                      child: Text("No hay información para mostrar",
                          style: TextStyle(
                              color: Color(0xff6456EB),
                              fontSize: 19,
                              fontWeight: FontWeight.w400)))));
    });
  }

  Widget _reservationsCard(int i) {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 70,
                height: 90,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F1FE),
                    borderRadius: BorderRadius.circular(26)),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 54.0,
                            height: 54.0,
                            child: Container(
                                width: 55.0,
                                height: 58.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: items[i].commonZone!.image?.url !=
                                              null
                                          ? NetworkImage(items[i]
                                              .commonZone!
                                              .image
                                              ?.url as String)
                                          : AssetImage(
                                                  'assets/images/image-default.png')
                                              as ImageProvider,
                                    )))),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 160) / 1.5,
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                items[i].commonZone != null
                                    ? items[i].commonZone!.name.toString()
                                    : "",
                                style: TextStyle(
                                    color: Color(0xFF343887),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[i].start!.day.toString(),
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF343887)),
                                ),
                                Text(
                                  months[items[i].start!.month - 1],
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF343887)),
                                )
                              ],
                            )),
                        Container(
                            height: 30,
                            width: 1,
                            color: Color(0xFFC9C7DB),
                            margin: EdgeInsets.only(left: 12.0, right: 12.0)),
                        SizedBox(
                            width: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateTimeHelper.hm(items[i].start as DateTime),
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF343887)),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 30,
                child: IconButton(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.more_vert,
                      color: Color(0xFF8075FB),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              height: 200,
                              margin: EdgeInsets.only(top: 35.0),
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: 35.0, left: 25, right: 25),
                                  child: Column(
                                    children: [
                                      rowOption(items[i], context, "Editar",
                                          () {
                                        BlocProvider.of<CommonZonesBloc>(
                                                context)
                                            .add(EditReservation(
                                                context, items[i]));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FormReservation()));
                                      }),
                                      rowOption(items[i], context, "Eliminar",
                                          () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        _deleteReservation(
                                            context, items[i].id.toString());
                                      })
                                    ],
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget rowOption(
      Reservations reservation, context, title, VoidCallback voidCallback) {
    IconData icon = const IconData(0xe90e, fontFamily: 'icomoon');

    if (title == 'Eliminar') {
      icon = const IconData(0xe917, fontFamily: 'icomoon');
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 11.0),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xFFF7F7FB),
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(icon, size: 22, color: Color(0xFF8378FC))),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF5C5D87),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        ElevatedButton(
          child: Icon(const IconData(0xe91f, fontFamily: 'icomoon'),
              size: 15, color: Color(0xFFF9FAFE)),
          onPressed: voidCallback,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 0),
            fixedSize: const Size(4, 4),
            shape: const CircleBorder(),
            primary: const Color(0xFF714CF6),
          ),
        ),
      ],
    );
  }

  void _deleteReservation(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar la reservación?'),
            actions: [
              TextButton(
                  onPressed: () {
                    BlocProvider.of<CommonZonesBloc>(context)
                        .add(DeleteReservation(context, id));
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
