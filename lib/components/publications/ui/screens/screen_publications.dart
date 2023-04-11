import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/widgets/main_menu.dart';
import 'package:hipal/components/publications/bloc/publications_by_residential_bloc.dart';
import 'package:hipal/components/publications/model/publication_in_list_by_residential.dart';
import 'package:hipal/components/publications/ui/screens/widgets/publicationInList.dart';
import 'package:hipal/widgets/leading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenPublications extends StatefulWidget {
  const ScreenPublications({Key? key}) : super(key: key);

  _ScreenPublications createState() => _ScreenPublications();
}

class _ScreenPublications extends State<ScreenPublications> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool loadFinished = false;

  List<PublicationInListByResidential> items = [];

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      setState(() {
        loadFinished = true;
      });
    });
    BlocProvider.of<PublicationsByResidentialBloc>(context)
        .add(LoadRefreshPublicationsByResidential(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Publicaciones',
              style: TextStyle(
                color: Color(0xff343887),
                fontSize: 14,
              ),
            ),
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: LeadingHipal(color: Color(0xff8075FB)),
            // backgroundColor: Colors.blueAccent,
          ),
          body: _body(),
          drawer: DrawerMainMenu(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ));
  }

  Widget _body() {
    return BlocBuilder<PublicationsByResidentialBloc,
        PublicationsByResidentialState>(builder: (context, state) {
      items = (state.publications.length > 0 ? state.publications : []);
      return items.length == 0
          ? Container(
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              height: 40,
              child: !loadFinished
                  ? CircularProgressIndicator(
                      color: const Color(0xff6456EB),
                    )
                  : Text("No hay publicaciones para mostrar",
                      style: TextStyle(
                          color: Color(0xff6456EB),
                          fontSize: 19,
                          fontWeight: FontWeight.w400)))
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () async {
                BlocProvider.of<PublicationsByResidentialBloc>(context)
                    .add(LoadRefreshPublicationsByResidential(context));
                await Future.delayed(Duration(seconds: 6));

                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                BlocProvider.of<PublicationsByResidentialBloc>(context)
                    .add(LoadMorePublicationsByResidential(context));
                await Future.delayed(Duration(seconds: 6));

                _refreshController.loadComplete();
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (c, i) =>
                    PublicationInList(publicationInListByResidential: items[i]),
                itemCount: items.length,
                // ],
              ));
    });
  }
}
