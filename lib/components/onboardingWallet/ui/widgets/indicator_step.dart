import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class IndicatorStep extends StatelessWidget {
  const IndicatorStep({
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isActive ? '#8639D8'.toColor() : Colors.black45,
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
