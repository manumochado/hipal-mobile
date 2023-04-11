import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

import 'background_zone.dart';

// ignore: must_be_immutable
class HeaderZone extends StatelessWidget {
  const HeaderZone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: '#f6f7fe'.toColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //appBarPrincipal,
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width,
                (360 * 0.7681159420289855)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          )
          //description
        ],
      ),
    );
  }
}
