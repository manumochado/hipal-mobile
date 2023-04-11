import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{

  String title;
  VoidCallback onPressed;
  EdgeInsets? margin;

  GradientButton(this.title,this.onPressed, this.margin);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.maxFinite,
      margin: margin,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8C81FE),
              Color(0xFF776BF8)
            ],
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(123, 111, 250, 0.34),
                blurRadius: 9,
                offset: Offset(0,5)
            ),
          ]
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent
        ),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.0
          ),
        ),
      ),
    );
  }

}