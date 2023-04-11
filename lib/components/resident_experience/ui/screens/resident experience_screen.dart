import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:hipal/components/resident_experience/ui/widgets/form.dart';
import 'package:hipal/components/resident_experience/ui/widgets/my_pqr.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

class ResidentExperienceScreen extends StatefulWidget {
  createState() => _ResidentExperienceScreen();
}

class _ResidentExperienceScreen extends State<ResidentExperienceScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      BlocProvider.of<ResidentExperienceBloc>(context)
          ..isMounted = true
          ..add(LoadResidentExperiences(context, refresh: true))
          ..add(LoadPqrTypes(context))
          ..add(LoadPqrCategories(context));

      BlocProvider.of<NotificationsBloc>(context)
          .add(SetViewNotificationsByType(context, type: 'ResidentExperience'));
    });
  }

  @override
  void deactivate() {
    BlocProvider.of<ResidentExperienceBloc>(context).isMounted = false;
    super.deactivate();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<ResidentExperienceBloc, ResidentExperienceState>(
              builder: (context, state) {
            return AppBarTabs(
              title: state.title,
              pageBack: 'dashboard',
              index: state.indexTab,
              onTap: (value) => {
                BlocProvider.of<ResidentExperienceBloc>(context)
                    .add(ChangeIndex(value))
              },
              tabsTitle: [
                {
                  'title': Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mis PQR'),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  )
                },
                {
                  'icon': const IconData(0xe91f, fontFamily: 'icomoon'),
                  'title': Text('Agregar PQR'),
                },
              ],
              tabsContent: [MyPqr(), ResidentExperienceForm()],
            );
          }),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ));
  }
}
