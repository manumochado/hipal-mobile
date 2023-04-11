import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class StepIndicator extends StatelessWidget {
  StepIndicator(
      {Key? key, this.space = const SizedBox(width: 5.0), required this.step})
      : super(key: key);

  final SizedBox space;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 0 || step > 0 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        space,
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 1 || step > 1 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        space,
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 2 || step > 2 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        space,
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 3 || step > 3 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        space,
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 4 || step > 4 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        space,
        Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
              color: step == 5 || step > 5 ? "#8639D8".toColor() : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
      ],
    );
  }
}
