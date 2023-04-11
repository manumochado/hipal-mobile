import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/components/notifications/model/notifications_response.dart';
import 'package:hipal/components/notifications/ui/widgets/list.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/widgets/main_menu.dart';
import 'package:hipal/widgets/leading.dart';

class NotificationsScreen extends StatefulWidget  {
  @override
  _NotificationsScreen createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen>  {
  List<NotificationApp> items =  [];

  @override
  void initState() {    
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) { 
      BlocProvider.of<NotificationsBloc>(context).add(LoadNotifications(context, refresh: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: BlocBuilder<NotificationsBloc, NotificationsState>(builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: false,
            appBar: AppBar(
                title: Text(
                    'Notificaciones',
                    style: TextStyle(
                        color: Color(0xff343887),
                        fontSize: 14
                    )
                ),
                elevation: 1,
                centerTitle: true,
                backgroundColor: Colors.white,
                // backgroundColor: Colors.blueAccent,
                leading: LeadingHipal(color: Color(0xff8075FB)),
                actions: [
                  IconButton(
                    icon: Icon(Icons.library_add_check_outlined),
                    color: Color(0xff8075FB),
                    onPressed: () {
                        BlocProvider.of<NotificationsBloc>(context).add(SetViewAllNotifications(context));
                    },
                  )
                ]
            ),
            backgroundColor: Colors.white,
            drawer: DrawerMainMenu(),

            body: NotificationsList(),

            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: (MediaQuery.of(context).viewInsets.bottom>0) ? Text("") : FloatingActionBtn(),
            bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
          );

        })
    );
  }

}