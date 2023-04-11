import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';

class BtnNavigationBar extends StatefulWidget {
  BtnNavigationBar({Key? key}) : super(key: key);

  @override
  State<BtnNavigationBar> createState() => _BtnNavigationBarState();
}

class _BtnNavigationBarState extends State<BtnNavigationBar> {
  int currentTab = 0;
  double pixelsText = 9.0;
  double pixelsIcon = 32.0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatsBloc>(context).add(InitChat(context));
    BlocProvider.of<NotificationsBloc>(context).add(InitNotifications(context));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonWidth = size.width / 5;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: buttonWidth,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'dashboard');
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        const IconData(0xe935, fontFamily: 'icomoon'),
                        color: Color(0xff8378FC),
                        size: pixelsIcon,
                      ),
                      Text(
                        'Inicio',
                        style: TextStyle(
                          fontSize: pixelsText,
                          color: currentTab == 0
                              ? Color(0xff897EFD)
                              : Color(0xffB1B4C7),
                        ),
                      )
                    ],
                  ),
                ),
                _buttonNotification(buttonWidth),
                SizedBox(width: buttonWidth),
                _buttonChat(buttonWidth),
                MaterialButton(
                  minWidth: buttonWidth,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pushNamed('clasificados');
                    setState(() {
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/logo_new.png', width: 30),
                      Text(
                        'Clasificados',
                        style: TextStyle(
                          fontSize: pixelsText,
                          color: currentTab == 3
                              ? Color(0xff897EFD)
                              : Color(0xffB1B4C7),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rowOption(context, title, VoidCallback voidCallback) {
    Map<String, dynamic> icons = {
      "Publicaciones": const IconData(0xe913, fontFamily: 'icomoon'),
    };

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
                child: Icon(icons[title], size: 22, color: Color(0xFF8378FC))),
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
          child: Icon(Icons.arrow_forward, size: 15, color: Color(0xFFF9FAFE)),
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

  Widget _buttonNotification(double buttonWidth) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
      return MaterialButton(
        minWidth: buttonWidth,
        padding: EdgeInsets.all(0),
        onPressed: () {
          setState(() {
            currentTab = 1;
            Navigator.pushReplacementNamed(context, 'notification');
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (state.totalUnviewed > 0)
                ? Badge(
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(end: -5),
                    borderRadius: BorderRadius.circular(100),
                    badgeColor: Color(0xffFE9D6D),
                    padding: EdgeInsets.all(5.0),
                    badgeContent: Text(state.totalUnviewed.toString(),
                        style: TextStyle(
                            color: Color(0xffffffff), fontSize: 10.0)),
                    child: Icon(const IconData(0xe939, fontFamily: 'icomoon'),
                        color: Color(0xff8378FC), size: pixelsIcon),
                  )
                : Icon(const IconData(0xe939, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC), size: pixelsIcon),
            Text(
              'Notificación',
              style: TextStyle(
                color: currentTab == 1 ? Color(0xff897EFD) : Color(0xffB1B4C7),
                fontSize: pixelsText,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buttonChat(double buttonWidth) {
    return BlocBuilder<ChatsBloc, ChatsState>(builder: (context, state) {
      return MaterialButton(
        minWidth: buttonWidth,
        padding: EdgeInsets.all(0),
        onPressed: () {
          setState(() {
            currentTab = 2;
            Navigator.pushReplacementNamed(context, 'chat');
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (state.notView > 0)
                ? Badge(
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(end: -5),
                    borderRadius: BorderRadius.circular(100),
                    badgeColor: Color(0xffFE9D6D),
                    padding: EdgeInsets.all(5.0),
                    badgeContent: Text(state.notView.toString(),
                        style: TextStyle(
                            color: Color(0xffffffff), fontSize: 10.0)),
                    child: Icon(const IconData(0xe938, fontFamily: 'icomoon'),
                        color: Color(0xff8378FC), size: pixelsIcon),
                  )
                : Icon(const IconData(0xe938, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC), size: pixelsIcon),
            Text(
              'Chat',
              style: TextStyle(
                color: currentTab == 2 ? Color(0xff897EFD) : Color(0xffB1B4C7),
                fontSize: pixelsText,
              ),
            ),
          ],
        ),
      );
    });
  }
}
