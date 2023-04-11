import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/ui/widgets/square_button.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_inicio.dart';
import 'package:hipal/components/documentaryCenter/bloc/documentarycenter_bloc.dart';
import 'package:hipal/components/documentaryCenter/ui/widgets/document_button.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenDocuments extends StatefulWidget {
  List<Document> documentsFiles;
  String categoryName;

  ScreenDocuments({required this.documentsFiles, required this.categoryName});

  @override
  createState() => _ScreenDocuments();
}

class _ScreenDocuments extends State<ScreenDocuments> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _controller = TextEditingController();
  bool loadFinished = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 10), () {
      setState(() {
        loadFinished = true;
      });
    });
    return BlocBuilder<DocumentarycenterBloc, DocumentarycenterState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBarBackSearch(
            color_buttons: 0xFFF8F8F8,
            color_title: 0xFFF8F8F8,
            color_background: 0xFF6456EB,
            name_title: widget.categoryName,
            view: 'documentary-center',
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
                /*BlocProvider.of<DocumentarycenterBloc>(context).add( GetDocuments(context, true) );
                        await Future.delayed(Duration(milliseconds: 1000));
                        _refreshController.loadComplete();*/
              },
              child: widget.documentsFiles.length > 0
                  ? ListView(
                      children: [
                        searchBox(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _listDocuments(widget.documentsFiles))
                      ],
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 210),
                      alignment: Alignment.center,
                      height: 40,
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
    });
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
                        //context.read<DocumentarycenterBloc>().add(searchCategory(context,_controller.text));
                      },
                    )),
                border: InputBorder.none),
          ),
        ),
      );
    });
  }

  _listDocuments(List<Document> items) {
    List<Widget> list = [];

    for (var i = 0; i < items.length; i += 2) {
      if ((items.length - 1) == (0)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DocumentButton(
                margin: EdgeInsets.only(top: 30),
                title: "",
                url: items[i].url.toString(),
                subtitle: DateFormat('yyyy/MM/dd')
                    .format(items[i].createdAt!)
                    .toString(),
                voidCallback: () {})
          ],
        ));
      }

      if ((items.length - 1) >= (i + 1)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DocumentButton(
                margin: EdgeInsets.only(right: 30, top: 30),
                title: "",
                url: items[i].url.toString(),
                subtitle: DateFormat('yyyy/MM/dd')
                    .format(items[i].createdAt!)
                    .toString(),
                voidCallback: () {}),
            DocumentButton(
                margin: EdgeInsets.only(top: 30),
                title: "",
                url: items[i + 1].url.toString(),
                subtitle: DateFormat('yyyy/MM/dd')
                    .format(items[i + 1].createdAt!)
                    .toString(),
                voidCallback: () {})
          ],
        ));
      }
      if ((items.length - 1) == (i + 2)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DocumentButton(
                margin: EdgeInsets.only(top: 30),
                title: "",
                url: items[i + 2].url.toString(),
                subtitle: DateFormat('yyyy/MM/dd')
                    .format(items[i + 2].createdAt!)
                    .toString(),
                voidCallback: () {})
          ],
        ));
      }
    }

    return list;
  }
}
