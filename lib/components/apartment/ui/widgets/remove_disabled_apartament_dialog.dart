import 'package:flutter/material.dart';

showDialogApartmentDelDisabled(BuildContext context, String msg) {
  return showDialog<void>(
    useSafeArea: false,
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(31.0))),
        insetPadding: EdgeInsets.all(0),
        scrollable: true,
        content: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(31)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Center(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(131, 120, 252, 1),
                  fontFamily: 'BasicCommercial LT Roman',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
