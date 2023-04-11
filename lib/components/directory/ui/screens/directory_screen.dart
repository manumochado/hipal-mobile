import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/directory/bloc/directory_bloc.dart';
import 'package:hipal/components/directory/ui/widgets/list_directory_emergency.dart';
import 'package:hipal/components/directory/ui/widgets/list_directory_residential.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_tabs.dart';

class DirectoryScreen extends StatefulWidget {
  createState() => _DirectoryScreen();
}

class _DirectoryScreen extends State<DirectoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: AppBarTabs(
            title: "Directorio",
            pageBack: 'dashboard',
            tabsTitle: [
              {
                'title': Text('Emergencias'),
              },
              {
                'title': Text('Edificio'),
              },
            ],
            tabsContent: [
              ListDirectoryEmergency(),
              ListDirectoryResidential(),
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ));
  }
}
