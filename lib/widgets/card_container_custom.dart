import 'package:flutter/material.dart';

class CardContainerCustom extends StatelessWidget {
  final Widget child;
  final EdgeInsets edgeInsets;

  const CardContainerCustom(
      {Key? key, required this.child, required this.edgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: double.infinity,
        padding: edgeInsets,
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      );
}
