import 'dart:convert';
import 'package:flutter/material.dart';

class SingletonStatusDialog {
  static final SingletonStatusDialog _singleton = SingletonStatusDialog._internal();

  factory SingletonStatusDialog() {
    return _singleton;
  }

  SingletonStatusDialog._internal();

  String statusDialog = "Cerrado";
  bool initErrorsRed = false;

  String get getisOpen => statusDialog;
  bool get getinitErrorsRed => initErrorsRed;

  void open() {
    statusDialog = "Abierto";
  }

  void SetinitErrors() {
    initErrorsRed = true;
  }

  void RemoveInitErrors() {
    initErrorsRed = false;
  }

  void close() {
    statusDialog = "Cerrado";
  }

  void finish() {
    statusDialog = "Finalizado";
  }

  void init() {
    statusDialog = "Inicializado";
  }


}

class DialogHipal extends ChangeNotifier {
  static Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
    String title = "";
    String message = "";
    String button = "Listo";
    Color color = Color(0xFF776BF8);
    // Color color = Color(0xFFF1464F); // Danger
    // Color color = Color(0xFF4DA979); // Success

    if (arguments != null) {
      final Map<String, dynamic> params = json.decode(arguments as String);
      title = params['title'];
      message = params['message'].toString();
      color = params['color'] != null ? Color(params['color']) : color;
    } else {
      print("git");
    }

    return DialogRoute<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: color,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            topEnd: Radius.circular(10))),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 20, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(10),
                            bottomEnd: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0X3A3A3A),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Text(message,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff000000)),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 22,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color: color,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: color,
                              child: Text(
                                button,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
