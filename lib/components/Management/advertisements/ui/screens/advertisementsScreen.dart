import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/model/advertisements.dart';
import 'package:hipal/components/Management/advertisements/ui/screens/detailsAdvertisements.dart';

import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AdvertisementsScreen extends StatefulWidget {
  AdvertisementsScreen({Key? key}) : super(key: key);

  @override
  State<AdvertisementsScreen> createState() => _AdvertisementsScreenState();
}

class _AdvertisementsScreenState extends State<AdvertisementsScreen> {
  bool loadFinished = false;

  @override
  void initState() {
    BlocProvider.of<AdvertisementsBloc>(context)
        .add(LoadRefreshAdvertisements(context));
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Advertisements> items = [];
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    try {
      Timer(const Duration(seconds: 10), () {
        setState(() {
          loadFinished = true;
        });
      });
    } catch (e) {}
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
      builder: (context, state) {
        items = (state.advertisements != null ? state.advertisements : [])!;
        return WillPopScope(
            onWillPop: () async {
              Navigator.pushReplacementNamed(context, "dashboard");
              return Future.value(true);
            },
            child: Scaffold(
              extendBodyBehindAppBar: false,
              resizeToAvoidBottomInset: false,
              appBar: AppBarBackSearch(
                color_buttons: 0xFFFFFFFF,
                color_title: 0xFFFFFFFF,
                name_title: 'Gestión del Administrador',
                color_background: 0xFF6456EB,
                with_search: false,
                view: 'dashboard',
              ),
              body: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment(0, 2.0),
                          colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                        ),
                      ),
                      height: 220,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 30, right: 30, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Encuentra todas las gestiones que se han realizado en nuestro edificio',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xffFFFFFF)),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  '${items.length.toString()} Anuncios',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xffDFDDFD)),
                                ),
                                SizedBox(height: 15),
                                _search_field(),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            ),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Color(0xFFF9FAFE),
                      ),
                      child: items.length == 0
                          ? Container(
                              margin: EdgeInsets.only(top: 50),
                              alignment: Alignment.center,
                              height: 40,
                              child: !loadFinished
                                  ? CircularProgressIndicator(
                                      color: const Color(0xff6456EB),
                                    )
                                  : Text("No hay anuncios para mostar",
                                      style: TextStyle(
                                          color: Color(0xff6456EB),
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400)))
                          : SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: true,
                              controller: _refreshController,
                              onRefresh: () async {
                                BlocProvider.of<AdvertisementsBloc>(context)
                                    .add(LoadRefreshAdvertisements(context));
                                await Future.delayed(
                                    Duration(milliseconds: 1000));
                                _refreshController.refreshCompleted();
                              },
                              onLoading: () async {
                                BlocProvider.of<AdvertisementsBloc>(context)
                                    .add(LoadRefreshAdvertisements(context));
                                await Future.delayed(
                                    Duration(milliseconds: 1000));
                                _refreshController.loadComplete();
                              },
                              child: items.length > 0
                                  ? Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (c, i) =>
                                            _adversimentsCard(i),
                                        itemCount: items.length,
                                        // ],
                                      ),
                                    )
                                  : Container(),
                            ),
                    ),
                  ],
                ),
              ),
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionBtn(),
              bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
            ));
      },
    );
  }

  Widget _search_field() {
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
        builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'Buscar...',
              hintStyle: TextStyle(color: Color(0xff9FA7B8), fontSize: 14),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              suffixIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                    ),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.search,
                          size: 25, color: Color(0xffffffff)),
                      onPressed: () {
                        context.read<AdvertisementsBloc>().add(
                            searchAdvertisements(context, _controller.text));
                      })),
            ),
          ),
        ),
      );
    });
  }

  Widget _adversimentsCard(int i) {
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Card(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            color: Color(0xffF2F0FA),
            child: ListTile(
              leading: (items[i].image == null || items[i].image == '')
                  ? Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    )
                  : Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        image: DecorationImage(
                          image: NetworkImage(items[i].image!.url != null
                              ? items[i].image!.url.toString()
                              : ''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
              title: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  items[i].theme != null ? items[i].theme.toString() : '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff897EFD)),
                ),
              ),
              subtitle: Row(
                children: [
                  Image.asset(
                    'assets/images/vigencia.png',
                    width: 15,
                    height: 15,
                    color: Color(0xff8176FB),
                  ),
                  SizedBox(width: 10),
                  Text(
                    items[i].date != null
                        ? 'publicado el dia ${DateFormat('dd/MM/yyyy').format(items[i].date as DateTime)}'
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Color(0xff5C5D87)),
                  ),
                ],
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsAdvertisements(i)),
                )
              },
            ));
      } else {
        return Container();
      }
    });
  }
}
