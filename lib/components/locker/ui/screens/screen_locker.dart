import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/locker/bloc/lockers_bloc.dart';
import 'package:hipal/components/locker/ui/widgets/list_delivered.dart';
import 'package:hipal/components/locker/ui/widgets/list_pending.dart';
import 'package:hipal/components/locker/ui/widgets/list_returned.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';

class ScreenLocker extends StatefulWidget {
  _ScreenLocker createState() => _ScreenLocker();
}

class _ScreenLocker extends State<ScreenLocker> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      BlocProvider.of<LockersBloc>(context)
        ..add(LoadRefreshLocker(context, "Entregado"))
        ..add(LoadRefreshLocker(context, "Pendiente"))
        ..add(LoadRefreshLocker(context, "Devuelto"));
      BlocProvider.of<NotificationsBloc>(context)
          .add(SetViewNotificationsByType(context, type: 'Locker'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<LockersBloc, LockersState>(builder: (context, state) {
      // return _bodyLocker();
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: _bodyLocker(),
        backgroundColor: Color(0xFF000000),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }

  Widget _bodyLocker() {
    return BlocBuilder<LockersBloc, LockersState>(builder: (context, state) {
      return AppBarTabs(
        title: state.title,
        pageBack: 'dashboard',
        index: state.indexTab,
        onTap: (value) {
          BlocProvider.of<LockersBloc>(context).add(ChangeIndex(value));
        },
        tabsTitle: [
          {
            'title': Text('Entregados', style: TextStyle(fontSize: 13)),
          },
          {
            //'icon': const IconData(0xe91f, fontFamily: 'icomoon'),
            'title': Row(
              children: [
                Text(
                  'Pendientes',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  width: 2.0,
                ),
                Badge(
                  toAnimate: false,
                  badgeColor: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8),
                  padding: EdgeInsets.all(5.0),
                  badgeContent: Text(state.pending.toString(),
                      style: TextStyle(color: Color(0xff6456EB))),
                ),
              ],
            )
          },
          {
            'title': Text('Devueltos', style: TextStyle(fontSize: 13)),
          },
        ],
        tabsContent: [
          ListDelivered(),
          ListPending(),
          ListReturned(),
        ],
      );
    });
  }
}
