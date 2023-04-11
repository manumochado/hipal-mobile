import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class BuildFormFieldText extends StatelessWidget {
  const BuildFormFieldText({
    Key? key,
    this.hintText = "",
    required this.label,
    required this.controller,
    this.validate = null,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextEditingController controller;
  final validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: "#343887".toColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0)),
            TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff8176FB), width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff8176FB), width: 2)),
                    hintText: hintText,
                    labelText: label,
                    labelStyle: TextStyle(
                      color: Color(0xff9FA7B8),
                      fontWeight: FontWeight.normal,
                    )),
                validator: validate == null
                    ? (value) {
                        return null;
                      }
                    : validate),
          ],
        ));
  }
}
