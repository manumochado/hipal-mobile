import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class ButtonArrow extends StatelessWidget {
  const ButtonArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: '#8639D8'.toColor(),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Icon(Icons.keyboard_arrow_right_rounded,
          color: Colors.white, size: 60.0),
    );
  }
}
