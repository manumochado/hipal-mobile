import 'package:flutter/material.dart';

class BottonNavigationWallet extends StatelessWidget {
  const BottonNavigationWallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/images/bottom3.png'),
          Image.asset('assets/images/bottom2.png'),
          Image.asset('assets/images/bottom1.png')
        ],
      ),
      SizedBox(
        height: 10.0,
      )
    ]);
  }
}
