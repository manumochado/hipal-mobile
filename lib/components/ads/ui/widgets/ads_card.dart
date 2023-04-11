import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/ads_bloc.dart';
import '../../model/ad.dart';

class AdsCard extends StatefulWidget {
  int ads;
  bool? fromNotification = false;

  AdsCard({required this.ads, this.fromNotification});

  _AdsCard createState() => _AdsCard();
}

class _AdsCard extends State<AdsCard> {
  List<Ads> adsItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.fromNotification == true) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((_) => _showMyDialogOfNotification(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    

    
    adsItems = (BlocProvider.of<AdsBloc>(context).state.ads != null
        ? BlocProvider.of<AdsBloc>(context).state.ads
        : [])!;


    return BlocBuilder<AdsBloc, AdsState>(builder: (context, state) {
      return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _showMyDialog(context, adsItems[widget.ads]);
                },
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width - 20,
                  margin:
                      EdgeInsets.only(bottom: 20, top: 0, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 241, 254, 1),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      shape: BoxShape.rectangle),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 70,
                                width: 70,
                                color: Color.fromRGBO(131, 120, 252, 1),
                                child: adsItems[widget.ads].image != null
                                    ? Image.network(
                                        adsItems[widget.ads].image!['url'],
                                        fit: BoxFit.cover,
                                      )
                                    : Container(),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  
                                  Text(
                                    adsItems[widget.ads].theme ?? '',
                                    //"Titulo del anuncio",
                                    style: TextStyle(
                                        color: Color.fromRGBO(131, 120, 252, 1),
                                        fontFamily: 'BasicCommercial LT Roman',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Fecha',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      159, 167, 184, 1),
                                                  fontFamily:
                                                      'BasicCommercial LT Roman',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              adsItems[widget.ads]
                                                  .date
                                                  .toString().substring(0, adsItems[widget.ads].date.toString().length > 10 ? 10 : adsItems[widget.ads].date.toString().length).replaceAll('null', 'Por definir'),
                                                 
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      92, 93, 135, 1),
                                                  fontFamily:
                                                      'BasicCommercial LT Roman',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      DottedBorder(
                                          padding: EdgeInsets.all(0.2),
                                          color:
                                              Color.fromRGBO(131, 120, 252, 1),
                                          strokeWidth: 0,
                                          child: Container(
                                            height: 30,
                                          )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Hora',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      159, 167, 184, 1),
                                                  fontFamily:
                                                      'BasicCommercial LT Roman',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null ? 'Por definir' : adsItems[widget.ads].hourStart} ${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null || adsItems[widget.ads].hourFinish == 'por definir' || adsItems[widget.ads].hourFinish == null ? '' : '-'} ${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null ? '' : adsItems[widget.ads].hourFinish == 'por definir' || adsItems[widget.ads].hourStart == null ? '' : adsItems[widget.ads].hourFinish}',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      92, 93, 135, 1),
                                                  fontFamily:
                                                      'BasicCommercial LT Roman',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ]),
                    ),
                  ),
                ),
              ),
            ]),
      );
    });
  }

  _showMyDialog(BuildContext context, Ads ads) {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(31.0))),
          insetPadding: EdgeInsets.all(0),
          scrollable: true,
          content: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(31)),
            child: Container(
              //margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width - 80,
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 185,
                            width: 328,
                            color: Color.fromRGBO(131, 120, 252, 1),
                            child: adsItems[widget.ads].image != null
                                ? Image.network(
                                    adsItems[widget.ads].image!['url'],
                                    fit: BoxFit.cover,
                                  )
                                : Container(),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          adsItems[widget.ads].theme ?? "",
                          //"Titulo del anuncio",
                          style: TextStyle(
                              color: Color.fromRGBO(131, 120, 252, 1),
                              fontFamily: 'BasicCommercial LT Roman',
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 328,
                          child: Text(
                            adsItems[widget.ads].description ?? "",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Color.fromRGBO(92, 93, 135, 1),
                                fontFamily: 'BasicCommercial LT Light',
                                fontSize: 18,
                                letterSpacing: 0.19,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 328,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Horario',
                                  style: TextStyle(
                                      color: Color.fromRGBO(52, 56, 135, 1),
                                      fontFamily: 'BasicCommercial LT Roman',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Fecha',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  159, 167, 184, 1),
                                              fontFamily:
                                                  'BasicCommercial LT Roman',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          adsItems[widget.ads]
                                              .date
                                              .toString()
                                              .substring(0, adsItems[widget.ads].date.toString().length > 10 ? 10 : adsItems[widget.ads].date.toString().length)
                                              .replaceAll('-', '/').replaceAll('---', 'Por definir').replaceAll('null', 'Por definir'),
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  92, 93, 135, 1),
                                              fontFamily:
                                                  'BasicCommercial LT Roman',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DottedBorder(
                                      padding: EdgeInsets.all(0.2),
                                      color: Color.fromRGBO(131, 120, 252, 1),
                                      strokeWidth: 0,
                                      child: Container(
                                        height: 30,
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Hora',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  159, 167, 184, 1),
                                              fontFamily:
                                                  'BasicCommercial LT Roman',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null ? 'Por definir' : adsItems[widget.ads].hourStart} ${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null || adsItems[widget.ads].hourFinish == 'por definir' || adsItems[widget.ads].hourFinish == null ? '' : '-'} ${adsItems[widget.ads].hourStart == 'por definir' || adsItems[widget.ads].hourStart == null ? '' : adsItems[widget.ads].hourFinish == 'por definir' || adsItems[widget.ads].hourStart == null ? '' : adsItems[widget.ads].hourFinish}',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  92, 93, 135, 1),
                                              fontFamily:
                                                  'BasicCommercial LT Roman',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ]),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //button add to calendar with icon
                    ads.date != null &&
                            ads.date != 'por definir' &&
                            ads.hourStart != null &&
                            ads.hourStart != 'por definir'
                        ? Container() //CalendarButton()
                        : Container(),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: 328,
                      height: 53,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(126, 114, 255, 1)),
                          primary: Color.fromRGBO(126, 114, 255, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cerrar',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(249, 250, 254, 1),
                                  fontFamily: 'BasicCommercial LT Roman',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _showMyDialogOfNotification(BuildContext context) {
    
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(31.0))),
          insetPadding: EdgeInsets.all(0),
          scrollable: true,
          content: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(31)),
            child: BlocBuilder<AdsBloc, AdsState>(
              builder: (context, state) {

                return Container(
                          //margin: EdgeInsets.only(top: 50),
                          height: MediaQuery.of(context).size.height - 200,
                          width: MediaQuery.of(context).size.width - 80,
                          child: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        height: 185,
                                        width: 328,
                                        color: Color.fromRGBO(131, 120, 252, 1),
                                        child: state.adById?.image != null
                                            ? Image.network(
                                                state.adById?.image!['url'],
                                                fit: BoxFit.cover,
                                              )
                                            : Container(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),

                                    Text(
                                      state.adById?.theme ?? '',
                                      //"Titulo del anuncio",
                                      style: TextStyle(
                                          color: Color.fromRGBO(131, 120, 252, 1),
                                          fontFamily: 'BasicCommercial LT Roman',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 328,
                                      child: Text(
                                        state.adById?.description ?? '',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color.fromRGBO(92, 93, 135, 1),
                                            fontFamily: 'BasicCommercial LT Light',
                                            fontSize: 18,
                                            letterSpacing: 0.19,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 328,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Horario',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(52, 56, 135, 1),
                                                  fontFamily: 'BasicCommercial LT Roman',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(children: <Widget>[
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Fecha',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              159, 167, 184, 1),
                                                          fontFamily:
                                                              'BasicCommercial LT Roman',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                       state.adById?.date
                                                      .toString()
                                                      .substring(0, state.adById!.date.toString().length > 10 ? 10 : state.adById!.date.toString().length)
                                                      .replaceAll('-', '/').replaceAll('null', 'Por definir').replaceAll('---', 'Por definir') ?? 'Por definir',
            
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              92, 93, 135, 1),
                                                          fontFamily:
                                                              'BasicCommercial LT Roman',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              DottedBorder(
                                                  padding: EdgeInsets.all(0.2),
                                                  color: Color.fromRGBO(131, 120, 252, 1),
                                                  strokeWidth: 0,
                                                  child: Container(
                                                    height: 30,
                                                  )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Hora',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              159, 167, 184, 1),
                                                          fontFamily:
                                                              'BasicCommercial LT Roman',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '${state.adById?.hourStart == 'por definir' || state.adById?.hourStart == null ? 'Por definir' : state.adById?.hourStart} ${state.adById?.hourStart == 'por definir' || state.adById?.hourStart == null || state.adById?.hourFinish == 'por definir' || state.adById?.hourFinish == null ? '' : '-'} ${state.adById?.hourStart == 'por definir' || state.adById?.hourStart == null ? '' : state.adById?.hourFinish == 'por definir' || state.adById?.hourStart == null ? '' : state.adById?.hourFinish}',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              92, 93, 135, 1),
                                                          fontFamily:
                                                              'BasicCommercial LT Roman',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ]),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                state.adById?.date != null &&
                                        state.adById?.date != 'por definir' &&
                                        state.adById?.hourStart != null &&
                                        state.adById?.hourStart != 'por definir'
                                        
                                    ? Container() //CalendarButton()
                                    : Container(),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 328,
                                  height: 53,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0,
                                          color: Color.fromRGBO(126, 114, 255, 1)),
                                      primary: Color.fromRGBO(126, 114, 255, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.pushReplacementNamed(
                                          context, 'notification');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cerrar',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(249, 250, 254, 1),
                                              fontFamily: 'BasicCommercial LT Roman',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );//hereeeeeeeeeeeeeeeeeeeeeeeeeeeee
            
              },)));
            
        
      },
    );
  }
}

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 328,
        height: 53,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
                width: 1.0,
                color: Color.fromRGBO(126, 114, 255, 1)),
            primary: Color.fromRGBO(249, 250, 254, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Agregar a mi calendario',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color:
                          Color.fromRGBO(131, 120, 252, 1),
                      fontFamily:
                          'BasicCommercial LT Roman',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/images/calendario.svg',
                  width: 24,
                  height: 24,
                  color: Color.fromRGBO(131, 120, 252, 1),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
