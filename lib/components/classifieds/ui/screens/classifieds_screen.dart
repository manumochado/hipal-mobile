import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/formclassified_bloc.dart';
import 'package:hipal/components/classifieds/ui/widgets/form.dart';
import 'package:hipal/components/classifieds/ui/widgets/lisMyClassifieds.dart';
import 'package:hipal/components/classifieds/ui/widgets/listBuildingClassifieds.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';

import 'package:hipal/widgets/appbar_tabs.dart';

class ClassifiedsScreen extends StatefulWidget {
  @override
  _ClassifiedsScreen createState() => _ClassifiedsScreen();
}

class _ClassifiedsScreen extends State<ClassifiedsScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      BlocProvider
        .of<ClassifiedsBloc>(context)
        ..add(LoadGeneralClassifieds(context, refresh: true))
        ..add(LoadUserClassifieds(context, refresh: true))
        ..add(InitTap());
        
      BlocProvider
        .of<NotificationsBloc>(context)
        .add(SetViewNotificationsByType(context, type: 'Classified'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'dashboard');
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<ClassifiedsBloc, ClassifiedsState>(
          builder: (context, state) {
            
            if (!state.authorized && !state.isLoadingGeneralClassifieds && !state.isLoadingUserClassifieds) {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                Navigator.maybePop(context).then((value) =>
                  BlocProvider.of<ClassifiedsBloc>(context).add(OnClearData()));
              });
            }

            return state.indexTab != 2 ? AppBarTabs(
              title: state.title,
              pageBack: 'dashboard',
              onTap: (value) {
                BlocProvider.of<ClassifiedsBloc>(context)
                  .add(ChangeClassifiedsTabIndex(value));
              },
              index: state.indexTab,
              tabsTitle: [
                {
                  'title': FittedBox(
                    child: Text('Mis \n clasificados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13, overflow: TextOverflow.ellipsis)),
                  )
                },
                {
                  'title': FittedBox(
                    child: Text(
                      'Clasificados \n Edificio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13, overflow: TextOverflow.ellipsis),
                    ),
                  )
                },
                
                {
                  'icon': const IconData(0xe91f, fontFamily: 'icomoon'),
                  'title': FittedBox(
                      child: Text(
                    'Agregar',
                    style:
                        TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis),
                  )),

                },
              ],
              tabsContent: [
                MyClassifiedsList(),
                BuildingClassifiedsList(),
                SizedBox.shrink()
              ],
            ) : ClassifiedsForm();
          }),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ),
     );
    }
}
