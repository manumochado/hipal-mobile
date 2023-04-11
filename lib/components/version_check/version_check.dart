import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VersionChecked extends StatefulWidget {
  VersionChecked(this.statusUpdate, this.versionUpdate);
  final bool statusUpdate;
  final String versionUpdate;
  @override
  _VersionCheckedState createState() => _VersionCheckedState();
}

class _VersionCheckedState extends State<VersionChecked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Container(
                      height: 200.0,
                      width: 800.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            scale: 1.0,
                            image: AssetImage('assets/images/splash_logo.png'),
                            fit: BoxFit.fitWidth),
                      ))),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('¡Debes actualizar tu aplicación!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text:
                                    'A continuación te redireccionaremos a la'),
                            TextSpan(
                                text:
                                    ' tienda de tu sistema operativo para que'),
                            TextSpan(text: ' puedas descargar nuestra última '),
                            TextSpan(
                                text: 'actualización(${widget.versionUpdate})')
                          ]))),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: _buttonUpdated())
            ],
          )),
    );
  }
}

Widget _buttonUpdated() {
  return MaterialButton(
      color: Color(0xFF776BF8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Color(0xff7E72FF),
        ),
      ),
      elevation: 0,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'ACTUALIZAR',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ]),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff7B6FFA).withOpacity(0.34),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          )),
      onPressed: () async {
        if (Platform.isAndroid || Platform.isIOS) {
          final appId =
              Platform.isAndroid ? 'com.hipal.co.hipal' : 'com.hipal.co.hipal';
          final url = Uri.parse(
            Platform.isAndroid
                ? "market://details?id=$appId"
                : "https://apps.apple.com/app/id$appId",
          );
          launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        }
      });
}
