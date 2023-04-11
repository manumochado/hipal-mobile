import 'package:flutter/material.dart';

class TextWithBox extends StatelessWidget {
  String text;
  int textColor;
  int textSize;
  int? backgroundColor;
  EdgeInsets padding;
  Gradient? gradient;

  TextWithBox(
      {required this.text,
      required this.textColor,
      required this.textSize,
      this.backgroundColor = 0xFFFFFFF,
      required this.padding,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: gradient == null ? Color(backgroundColor!) : null,
          borderRadius: BorderRadius.circular(12),
          gradient: gradient),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, //Color(textColor) Antiguo,
            fontSize: 10.0,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
