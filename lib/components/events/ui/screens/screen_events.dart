import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/events/bloc/event_register/event_register_bloc.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/components/events/ui/widgets/event_card.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenEvents extends StatefulWidget {
  _ScreenEvents createState() => _ScreenEvents();
}

class _ScreenEvents extends State<ScreenEvents> {
  List<Events> items = [];
  bool loadFinished = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _controller = TextEditingController();
  String userId = "";

  @override
  void initState() {
    BlocProvider.of<EventsBloc>(context).add(LoadRefreshEvents(context));
    userId =
        BlocProvider.of<UserBloc>(context).state.userInfo!.user!.id.toString();
    BlocProvider.of<EventRegisterBloc>(context)
        .add(LoadRefreshEventRegister(context, userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    BlocProvider.of<EventsBloc>(context).add(ChangeFromScreen("dashboard"));
    try {
      Timer(const Duration(seconds: 10), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(
            context, BlocProvider.of<EventsBloc>(context).state.fromScreen);
        return Future.value(true);
      },
      child: BlocBuilder<EventsBloc, EventsState>(builder: (context, state) {
        items = (state.events != null ? state.events : [])!;
        var total = (state.pagination != null)
            ? state.pagination!.total.toString()
            : '0';
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarBackSearch(
              color_buttons: 0xFFF8F8F8,
              color_title: 0xFFF8F8F8,
              color_background: 0xFF6456EB,
              name_title: state.title,
              view: 'dashboard',
              with_search: false),
          body: Stack(
            children: [
              Container(
                height: 180,
                width: size.width,
                padding: EdgeInsets.only(left: 20, right: 50),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6456EB),
                      Color(0xFF8639D8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment(0.0, 4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Encuentra todos los eventos de tu edificio aquí.",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
                    ),
                    Container(height: 10),
                    Text(
                      state.pagination != null
                          ? "${state.pagination!.total.toString()} Eventos"
                          : "0 Eventos",
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)),
                    ),
                    Container(height: 10),
                    _search_field(),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 180, bottom: 80),
                  child: items.length == 0
                      ? Container(
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
                        )
                      : SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          controller: _refreshController,
                          onRefresh: () async {
                            BlocProvider.of<EventRegisterBloc>(context)
                                .add(LoadRefreshEventRegister(context, userId));
                            BlocProvider.of<EventsBloc>(context)
                                .add(LoadRefreshEvents(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            // if failed,use refreshFailed()
                            _refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            BlocProvider.of<EventRegisterBloc>(context)
                                .add(LoadMoreEventRegister(context, userId));
                            BlocProvider.of<EventsBloc>(context)
                                .add(LoadMoreEvents(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            _refreshController.loadComplete();
                          },
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (c, i) => EventCard(
                              event: i,
                              imageSize: 250,
                            ),
                            itemCount: items.length,
                          ))),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      }),
    );
  }

  Widget _search_field() {
    return BlocBuilder<EventsBloc, EventsState>(builder: (context, state) {
      return Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              suffixIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                    ),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.search,
                          size: 25, color: Color(0xffffffff)),
                      onPressed: () {
                        print("Enviando ${_controller.text}");
                        context
                            .read<EventsBloc>()
                            .add(searchEvent(context, _controller.text));
                      })),
            ),
          ),
        ),
      );
    });
  }
}
