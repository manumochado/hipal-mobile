import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/ui/widgets/square_button.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_inicio.dart';
import 'package:hipal/components/documentaryCenter/bloc/documentarycenter_bloc.dart';
import 'package:hipal/components/documentaryCenter/model/documentaryCenter.dart';
import 'package:hipal/components/documentaryCenter/ui/screens/screen_documents.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenDocumentaryCenter extends StatefulWidget {
  @override
  createState() => _ScreenDocumentaryCenter();
}

class _ScreenDocumentaryCenter extends State<ScreenDocumentaryCenter> {
  List<DocumentaryCenter> items = [];
  final _controller = TextEditingController();
  bool loadFinished = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DocumentarycenterBloc>(context).add(GetDocuments(context));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 10), () {
      setState(() {
        loadFinished = true;
      });
    });
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<DocumentarycenterBloc, DocumentarycenterState>(
        builder: (context, state) {
      items = (state.documents != null ? state.documents : [])!;
      return Scaffold(
        appBar: AppBarBackSearch(
            color_buttons: 0xFFF8F8F8,
            color_title: 0xFFF8F8F8,
            color_background: 0xFF6456EB,
            name_title: state.title,
            view: 'dashboard',
            with_search: false),
        body: Stack(children: [
          DisenoInicio(),
          SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () async {
                BlocProvider.of<DocumentarycenterBloc>(context)
                    .add(GetDocuments(context));
                await Future.delayed(Duration(milliseconds: 1000));
                // if failed,use refreshFailed()
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                BlocProvider.of<DocumentarycenterBloc>(context)
                    .add(LoadMoreDocumentCategory(context));
                await Future.delayed(Duration(milliseconds: 1000));
                _refreshController.loadComplete();
              },
              child: items.length > 0
                  ? ListView(
                      children: [
                        searchBox(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _listDocuments(items))
                      ],
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 210),
                      alignment: Alignment.center,
                      height: 90,
                      child: !loadFinished
                          ? CircularProgressIndicator(
                              color: const Color(0xff6456EB),
                            )
                          : Text("No hay información para mostrar",
                              style: TextStyle(
                                  color: Color(0xff6456EB),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400))))
        ]),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }

  Widget searchBox() {
    return BlocBuilder<DocumentarycenterBloc, DocumentarycenterState>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 23),
          child: TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: 'Buscar ...',
                suffixIcon: Container(
                    margin: EdgeInsets.all(5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(const IconData(0xe904, fontFamily: 'icomoon'),
                          color: Color(0xFFFFFFFF), size: 25),
                      onPressed: () {
                        context
                            .read<DocumentarycenterBloc>()
                            .add(searchCategory(context, _controller.text));
                      },
                    )),
                border: InputBorder.none),
          ),
        ),
      );
    });
  }

  _listDocuments(List<DocumentaryCenter> items) {
    List<Widget> list = [];

    for (var i = 0; i < items.length; i += 2) {
      if ((items.length - 1) == (0)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareButton(
                margin: EdgeInsets.only(top: 30),
                title: items[i].nameCategory.toString(),
                url: items[i].image!.url.toString(),
                iconSize: 50,
                colorIcon: 0xFF6CD197,
                subtitle: items[i].documents != null
                    ? items[i].documents!.length.toString()
                    : "0",
                colorSubtitle: 0xFF7567E2,
                sizeSubtitle: 10,
                colorBackgroungSubtitle: 0xFFE6E2FD,
                voidCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenDocuments(
                              documentsFiles: items[i].documents!.toList(),
                              categoryName: items[i].nameCategory!)));
                })
          ],
        ));
      }

      if ((items.length - 1) >= (i + 1)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareButton(
                margin: EdgeInsets.only(right: 30, top: 30),
                title: items[i].nameCategory.toString(),
                url: items[i].image!.url.toString(),
                iconSize: 50,
                colorIcon: 0xFF7567E2,
                subtitle: items[i].documents != null
                    ? items[i].documents!.length.toString()
                    : "0",
                colorSubtitle: 0xFF7567E2,
                sizeSubtitle: 10,
                colorBackgroungSubtitle: 0xFFE6E2FD,
                voidCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenDocuments(
                              documentsFiles: items[i].documents!.toList(),
                              categoryName: items[i].nameCategory!)));
                }),
            SquareButton(
                margin: EdgeInsets.only(top: 30),
                title: items[i + 1].nameCategory.toString(),
                url: items[i + 1].image!.url.toString(),
                iconSize: 50,
                colorIcon: 0xFF6CD197,
                subtitle: items[i + 1].documents != null
                    ? items[i + 1].documents!.length.toString()
                    : "0",
                colorSubtitle: 0xFF7567E2,
                sizeSubtitle: 10,
                colorBackgroungSubtitle: 0xFFE6E2FD,
                voidCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenDocuments(
                              documentsFiles: items[i + 1].documents!.toList(),
                              categoryName: items[i + 1].nameCategory!)));
                })
          ],
        ));
      }
      if ((items.length - 1) == (i + 2)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareButton(
                margin: EdgeInsets.only(top: 30),
                title: items[i + 2].nameCategory.toString(),
                url: items[i + 2].image!.url.toString(),
                iconSize: 50,
                colorIcon: 0xFF6CD197,
                subtitle: items[i + 2].documents != null
                    ? items[i + 2].documents!.length.toString()
                    : "0",
                colorSubtitle: 0xFF7567E2,
                sizeSubtitle: 10,
                colorBackgroungSubtitle: 0xFFE6E2FD,
                voidCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenDocuments(
                              documentsFiles: items[i + 2].documents!.toList(),
                              categoryName: items[i + 2].nameCategory!)));
                })
          ],
        ));
      }
    }

    return list;
  }
}
