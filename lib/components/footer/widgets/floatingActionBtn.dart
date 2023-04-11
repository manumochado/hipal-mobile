import 'package:flutter/material.dart';
import 'package:hipal/environment/environment.dart';

class FloatingActionBtn extends StatefulWidget {
  FloatingActionBtn({Key? key}) : super(key: key);

  @override
  State<FloatingActionBtn> createState() => _FloatingActionBtnState();
}

class _FloatingActionBtnState extends State<FloatingActionBtn> {
  @override
  Widget build(BuildContext context) {
    final String tagEnvironment = Environment().config.TagEnvironment;

    return tagEnvironment == Environment.PROD ||
            tagEnvironment == Environment.STAGING
        ? FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            heroTag: null,
            child: Container(
              width: 51,
              height: 51,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: const Color(0xffB1B4C7)),
              child: Icon(
                const IconData(0xe944, fontFamily: 'icomoon'),
                color: Color.fromARGB(255, 220, 220, 222),
                size: 35.0,
              ),
            ),
            onPressed: null,
          )
        : FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            heroTag: null,
            child: Container(
              width: 51,
              height: 51,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xffFF515A), Color(0xffE43C45)])),
              child: Icon(
                const IconData(0xe944, fontFamily: 'icomoon'),
                color: Color(0xffffffff),
                size: 35.0,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'sos');
            },
          );
  }
}
