import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';

class NotificationService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static Future<void> showDialogHeipal(
      BuildContext context, Object? arguments) async {
    String title = "";
    String message = "";
    String button = "Listo";
    Color color = Color(0xFF776BF8);

    if (arguments != null) {
      final Map<String, dynamic> params = json.decode(arguments as String);
      title = params['title'];
      message = params['message'].toString();
      color = params['color'] != null ? Color(params['color']) : color;
    }

    final dialog = Dialog(
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
            padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
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
                    style: TextStyle(fontSize: 14, color: Color(0xff000000)),
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

    await showDialog(context: context, builder: (_) => dialog);
  }

  static void showSnackbar(
      {required String message, Color backgroundColor = Colors.black54}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.fixed,
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static void showToast(
    BuildContext context, {
    required String message,
    int? gravity = Toast.bottom,
    int? duration = Toast.lengthLong,
  }) {
    ToastContext().init(context);
    Toast.show(message, duration: duration, gravity: gravity);
  }

  static Future<void> showOkCancelDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmLabel = 'Confirmar',
    String cancelLabel = 'Cancelar',
    Function()? onConfirm,
    Function()? onCancel,
  }) async {
    final dialogBuilder = AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: Color(0xFF5D5E89)),
      ),
      content: Text(content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      actions: [
        TextButton(onPressed: onCancel, child: Text(cancelLabel)),
        TextButton(onPressed: onConfirm, child: Text(confirmLabel))
      ],
    );

    final cupertinoDialogBuilder = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(confirmLabel),
          onPressed: onConfirm,
        ),
        CupertinoDialogAction(
          child: Text(cancelLabel),
          onPressed: onCancel,
        )
      ],
    );
    (Platform.isAndroid || kIsWeb)
        ? await showDialog(
            context: context,
            builder: (_) => dialogBuilder,
          )
        : await showCupertinoDialog(
            context: context,
            builder: (_) => cupertinoDialogBuilder,
          );
  }

  static Future<void> showModalBottom(BuildContext context,
      {required Widget child,
      bool useRootNavigator = true,
      bool isScrollControlled = true,
      ShapeBorder? shape}) async {
    await showModalBottomSheet(
        useRootNavigator: useRootNavigator,
        isScrollControlled: isScrollControlled,
        shape: shape != null
            ? shape
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: Colors.white,
        context: context,
        builder: (_) => child);
  }

  static showAlert(BuildContext context,
      {required Widget child, AlertStyle? style}) {
    Alert(
            context: context,
            content: child,
            style: style ??
                AlertStyle(isButtonVisible: false, isCloseButton: false))
        .show();
  }
}
