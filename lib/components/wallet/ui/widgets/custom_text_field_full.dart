import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class CustomTextFieldFull extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String label;
  final String hintText;
 
  CustomTextFieldFull({
    Key? key, required this.controller, required this.label, this.keyboardType, this.hintText = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 65,
      
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(

            label, 
            style: TextStyle(
              fontFamily: 'Basic Commercial SR Pro',
              fontSize: 12 ,
              fontWeight: FontWeight.w400, 
              color: '#343887'.toColor()
            )
          ),

          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
            height: 40,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: '#E5E5E5'.toColor(),
              width: 2,
            ),
        
            ),

            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 14, color: '#CDCDCD'.toColor(), fontWeight: FontWeight.w500, fontFamily: 'Montserrat'),
                  
                  hintText: hintText
                ),
              ),
            ),

          )                        
        ]
      ),
    );
  }
} 