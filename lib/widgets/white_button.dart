import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WhiteButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  bool withBorder;
  int colorBorder;
  EdgeInsets? margins;

  WhiteButton(this.text, this.onPressed, this.withBorder, this.colorBorder,
      this.margins);

  @override
  Widget build(BuildContext context) {
    final border = TextButton.styleFrom(
      side: BorderSide(color: Color(colorBorder), width: 1.5),
    );

    return Container(
      margin: margins,
      width: double.maxFinite,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: withBorder ? border : null,
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xFF8378FC),
              fontWeight: FontWeight.w700,
              fontSize: 16.0),
        ),
      ),
    );
  }
}
