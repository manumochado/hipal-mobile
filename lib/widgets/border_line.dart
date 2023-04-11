import 'package:flutter/material.dart';

class BorderLine extends StatelessWidget{

  double height;
  double margin_left;
  double margin_right;
  int color;

  BorderLine(this.height, this.margin_left, this.margin_right, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      
        height: height,
        width: double.infinity,
        color: Color(color),
        margin: EdgeInsets.only(
            left: margin_left,
            right: margin_right
        )
    );
  }
  
}