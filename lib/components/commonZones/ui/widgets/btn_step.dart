import 'package:flutter/material.dart';

class BtnStep extends StatelessWidget {
  const BtnStep({
    required this.label,
    required this.navigation,
    this.width = 150.0,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback navigation;
  final width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(123, 111, 250, 0.34),
                blurRadius: 9,
                offset: Offset(0, 5)),
          ]),
      child: TextButton(
        onPressed: navigation,
        style: TextButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
      ),
    );
  }
}
