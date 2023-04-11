import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/ads/model/ad.dart';
import 'package:hipal/components/ads/ui/widgets/ads_card.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../widgets/appbar_back_ads.dart';
import '../../bloc/ads_bloc.dart';

class ScreenAds extends StatefulWidget {
  final bool? fromNotificationAds;
  final String? adsId;

  ScreenAds({Key? key, this.fromNotificationAds = false, this.adsId})
      : super(key: key);
  _ScreenAds createState() => _ScreenAds();
}

class _ScreenAds extends State<ScreenAds> {
  List<Ads> items = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String userId = "";

  @override
  void initState() {
    BlocProvider.of<EventsBloc>(context).add(LoadRefreshEvents(context));
    userId = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.id
            .toString() ??
        "";
    //BlocProvider.of<EventRegisterBloc>(context).add(LoadRefreshEventRegister(context, userId));

    BlocProvider.of<AdsBloc>(context).add(LoadAds(context));

    if (widget.adsId != null) {
      BlocProvider.of<AdsBloc>(context).add(getAdsById(context, widget.adsId!));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final idUser = (ModalRoute.of(context)?.settings.arguments ?? '') as String;
    final size = MediaQuery.of(context).size;
    BlocProvider.of<EventsBloc>(context).add(ChangeFromScreen("dashboard"));
    bool imageTrue = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString()
            .isNotEmpty ??
        false;
    String userImage = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString() ??
        "assets/images/users.png";

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(
            context, BlocProvider.of<EventsBloc>(context).state.fromScreen);
        return Future.value(true);
      },
      child: BlocBuilder<AdsBloc, AdsState>(builder: (context, state) {
        items = state.ads ?? [];

        if (!state.isMoreLoading) {
          _refreshController.loadComplete();
        }

        if (!state.isRefreshLoading) {
          _refreshController.refreshCompleted();
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarBackAds(
              color_buttons: 0xFFF8F8F8,
              color_title: 0xFFF8F8F8,
              color_background: 0xFF6456EB,
              //name_title: state.title,
              name_title: "Anuncios",
              view: 'dashboard',
              with_search: false),
          body: Stack(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 307,
                  width: size.width,
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                  child: Container(
                    width: size.width,
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              shape: BoxShape.circle,
                              image: imageTrue
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(userImage),
                                    )
                                  : DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(userImage),
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    '${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.firstname.toString()} ${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.lastname.toString()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            'BasicCommercial LT Roman')),
                                Text(
                                  '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                              .length >
                                          30
                                      ? '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                              .substring(0, 30) +
                                          '...'
                                      : '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'BasicCommercial LT Roman'),
                                ),
                              ]),
                        ]),
                  )),
              Positioned(
                top: 130,
                child: Container(
                  width: size.width,
                  height: 722,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 180, bottom: 80),
                  child: items.length == 0
                      ? Container(
                          margin: EdgeInsets.only(top: 50),
                          alignment: Alignment.center,
                          height: 40,
                          child: state.isInitLoading
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
                            BlocProvider.of<AdsBloc>(context)
                                .add(LoadRefreshAds(context));
                          },
                          onLoading: () async {
                            BlocProvider.of<AdsBloc>(context)
                                .add(LoadMoreAds(context));
                          },
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (c, i) => AdsCard(
                              ads: i,
                              fromNotification:
                                  widget.fromNotificationAds! ? true : false,
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
}
