import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    double? sizeLabel,
    IconData? prefixIcon,
    Color? prefixColor,
    suffixIcon,
    borderColor = Colors.transparent
    // IconData? suffixIcon,
  }) {
    Color color = (prefixColor!=null) ? prefixColor : Color(0xff8176FB);
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: 1
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff8176FB),
            width: 2
          )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xff9FA7B8),
          fontWeight: FontWeight.normal,
          fontSize: sizeLabel != null ? sizeLabel : null
        ),
        errorStyle: TextStyle(fontSize: 9, height: 0),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: color  )
          : null,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: 30 )
      );
  }  
}