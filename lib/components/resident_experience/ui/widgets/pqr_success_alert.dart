import 'package:flutter/material.dart';
import 'package:hipal/widgets/gradient_button.dart';

class SuccessAlert extends StatelessWidget {
  final String message;
  final String buttomTitle;
  final Function() onPressed;

  const SuccessAlert({
    Key? key,
    required this.message,
    this.buttomTitle = 'Entendido',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 80),
              Text('¡Muy bien!', style: TextStyle(
                color: Color(0xFF343887),
                fontSize: 28
              ),)
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton(
          buttomTitle,
          onPressed,
          null,
        )
      ],
    );
  }
}