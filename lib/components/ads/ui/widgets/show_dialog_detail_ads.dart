import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/ads/bloc/ads_bloc.dart';

showMyDialogDetailAdsOfNotification(BuildContext context) {
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
                    child: state.isLoadingadById
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                                          color:
                                              Color.fromRGBO(131, 120, 252, 1),
                                          fontFamily:
                                              'BasicCommercial LT Roman',
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
                                            color:
                                                Color.fromRGBO(92, 93, 135, 1),
                                            fontFamily:
                                                'BasicCommercial LT Light',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Horario',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      52, 56, 135, 1),
                                                  fontFamily:
                                                      'BasicCommercial LT Roman',
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
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      state.adById?.date
                                                              .toString()
                                                              .substring(
                                                                  0,
                                                                  state.adById!.date
                                                                              .toString()
                                                                              .length >
                                                                          10
                                                                      ? 10
                                                                      : state
                                                                          .adById!
                                                                          .date
                                                                          .toString()
                                                                          .length)
                                                              .replaceAll(
                                                                  '-', '/')
                                                              .replaceAll(
                                                                  'null',
                                                                  'Por definir')
                                                              .replaceAll('---',
                                                                  'Por definir') ??
                                                          'Por definir',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              92, 93, 135, 1),
                                                          fontFamily:
                                                              'BasicCommercial LT Roman',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              DottedBorder(
                                                  padding: EdgeInsets.all(0.2),
                                                  color: Color.fromRGBO(
                                                      131, 120, 252, 1),
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
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                          color:
                                              Color.fromRGBO(126, 114, 255, 1)),
                                      primary: Color.fromRGBO(126, 114, 255, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cerrar',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  249, 250, 254, 1),
                                              fontFamily:
                                                  'BasicCommercial LT Roman',
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
                  ); //hereeeeeeeeeeeeeeeeeeeeeeeeeeeee
                },
              )));
    },
  );
}
