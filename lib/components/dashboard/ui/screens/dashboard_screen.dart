import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/dashboard/ui/dashboard.dart';
import 'package:hipal/components/dashboard/ui/widgets/btn_some.dart';
import 'package:hipal/components/dashboard/ui/widgets/classifiedsDashboard.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_inicio.dart';
import 'package:hipal/components/dashboard/ui/widgets/list_btn_entretenimiento.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/menu.dart';
import 'package:hipal/components/user/repository/user_repository.dart';
import 'package:hipal/notifications/notification.dart';
import 'package:hipal/widgets/card_image.dart';

import '../../../publications/bloc/publications_by_residential_bloc.dart';
import '../../../publications/ui/screens/screen_publications.dart';
import '../../../user/bloc/user_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  _DashboardScreen createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<PublicationsByResidentialBloc>(context)
        .add(LoadRefreshPublicationsByResidential(context));
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
    BlocProvider.of<UserBloc>(context).add(GetCurrentUser(context, false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications(context);
    final size = MediaQuery.of(context).size;

    return WillPopScope(onWillPop: () async {
      SystemNavigator.pop();
      return Future.value(true);
    }, child: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: DrawerMainMenu(),
          body: Stack(
            children: [
              const DisenoInicio(),
              Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: PreferredSize(
                        preferredSize: const Size.fromHeight(60.0),
                        child: AppBarMenuSearch(0xFFFFFFFF, 0xFF6456EB)),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                        height: size.height,
                        width: size.width,
                        margin: EdgeInsets.only(top: 8, left: 20, bottom: 12),
                        child: state.isLoading
                            ? Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.white),
                                ),
                              )
                            : CardImage(
                                colorTitle: 0xFFFFFFFF,
                                colorDescription: 0xFFFFFFFF,
                                width: MediaQuery.of(context).size.width - 80,
                                isHome: true,
                              )),
                  ),
                  BtnSome(),
                  Expanded(
                    flex: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          ListBtnEntretenimiento(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Comunidad',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff343887),
                                            fontSize: 14),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff897EFD)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScreenPublications()));
                                          },
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Ver todos',
                                                style: TextStyle(
                                                  color: Color(0xFF897EFD),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 25,
                                                height: 25,
                                                child: Center(
                                                    child: Icon(
                                                  Icons.remove_red_eye_rounded,
                                                  size: 25,
                                                  color: Color(0xFF897EFD),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              DashboardClassifiedsList(),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    ));
  }
}
