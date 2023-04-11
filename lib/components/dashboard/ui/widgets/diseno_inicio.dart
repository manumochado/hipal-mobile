import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

// ignore: must_be_immutable
class DisenoInicio extends StatelessWidget {
  const DisenoInicio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appBarPrincipal = Container(
      height: 270,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 0.5),
          colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
    );
    return Container(
      color: '#f6f7fe'.toColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          appBarPrincipal,
          //description
        ],
      ),
    );
  }
}
