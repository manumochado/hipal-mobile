import 'package:flutter/material.dart';

class LeadingHipal extends StatelessWidget {
  LeadingHipal({this.color});

  Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        const IconData(0xe905, fontFamily: 'icomoon'),
        color: (color != null) ? color : Color(0xffffffff),
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
