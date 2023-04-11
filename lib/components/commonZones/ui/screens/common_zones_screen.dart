import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/commonZones/model/zone_model.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/widgets/appbar_back_search.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';
import '../widgets/calendar.dart';
import '../widgets/header_zone.dart';
import '../widgets/square_button.dart';

class CommonZonesScreen extends StatefulWidget {
  @override
  createState() => _CommonZonesScreen();
}

class _CommonZonesScreen extends State<CommonZonesScreen> {
  bool loadFinished = false;
  List<TypeZone> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CommonZonesBloc>(context).add(LoadTypeZone(context));
    BlocProvider.of<CommonZonesBloc>(context).add(ResetForm(context));
  }

  String parseStringCost(val) {
    String value = "";
    try {
      value = val.substring(0, val.indexOf('.'));
    } catch (err) {
      value = val;
    }
    //String convert = removePoint.substring(0, removePoint.indexOf('.'));

    return value;
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
            extendBody: true,
            appBar: AppBarBackSearch(
              color_buttons: 0xFFF8F8F8,
              color_title: 0xFFF8F8F8,
              name_title: 'Zonas comunes',
              color_background: 0xFF6456EB,
              with_search: false,
              view: 'dashboard',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionBtn(),
            bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
            body: Stack(
              children: [
                const HeaderZone(),
                BlocBuilder<CommonZonesBloc, CommonZonesState>(
                    builder: (context, state) {
                  items = (state.typeZones != null ? state.typeZones : [])!;
                  return Column(
                    children: [
                      Expanded(flex: 8, child: _title()),
                      Expanded(flex: 10, child: _subtitle()),
                      Expanded(
                        flex: 82,
                        child: (state.isLoading || items.length == 0)
                            ? Center(
                                child: state.isLoading
                                    ? CircularProgressIndicator(
                                        color: const Color(0xff6456EB),
                                      )
                                    : Text("No hay información para mostrar",
                                        style: TextStyle(
                                            color: Color(0xff6456EB),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400)))
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 2,
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return SquareButton(
                                      margin: EdgeInsets.only(
                                        right: 5,
                                        top: 0,
                                        left: 5,
                                      ),
                                      title: items[index].name.toString(),
                                      url: items[index].image != null
                                          ? items[index].image!.url.toString()
                                          : "",
                                      iconSize: 50,
                                      colorIcon: 0xFFFFFFF,
                                      colorBackgroungSubtitle: 0xFFFFFFF,
                                      backgroundS:
                                          items[index].color!.toColor(),
                                      sub: items[index].isFree ?? true
                                          ? 'Libre'
                                          : '\$ ${parseStringCost(items[index].costPerHour.toString())}',
                                      subtitle: items[index].isFree ?? true
                                          ? 'Libre'
                                          : '\$ ${parseStringCost(items[index].costPerHour.toString())}',
                                      voidCallback: () {
                                        BlocProvider.of<CommonZonesBloc>(
                                                context)
                                            .add(LoadCommonZonesForID(
                                                context,
                                                items[index].id.toString(),
                                                items[index]));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CalendarScreen()));
                                      });
                                },
                              ),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  );
                }),
              ],
            )));
  }

  _title() {
    return Container(
      margin: EdgeInsets.only(top: 22),
      child: Text(
        "Selecciona la zona que deseas reservar",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w400),
      ),
    );
  }

  _subtitle() {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                ),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(123, 111, 250, 0.34),
                      blurRadius: 9,
                      offset: Offset(0, 5)),
                ]),
            child: TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushReplacementNamed("my-reservations");
              },
              style: TextButton.styleFrom(
                  primary: Colors.transparent,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text(
                "Mis reservas",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
