import 'package:flutter/material.dart';
import 'package:hipal/const.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/utils/general.dart';

// ignore: must_be_immutable
class DisenoBtnSome extends StatefulWidget {
  String pathImage;
  String nameDescription;
  String view;

  DisenoBtnSome(this.nameDescription, this.pathImage, this.view, {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DisenoBtnSome> createState() =>
      // ignore: no_logic_in_create_state
      _DisenoBtnSomeState();
}

class _DisenoBtnSomeState extends State<DisenoBtnSome> {
  @override
  Widget build(BuildContext context) {
    final String tagEnvironment = Environment().config.TagEnvironment;

    final elipseBtn = disableModules(widget.view, constDisableModules) &&
            tagEnvironment == Environment.PROD
        ? Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(58),
              color: const Color(0xffB1B4C7),
            ),
            child: Center(
              child: IconButton(
                icon: Image.asset(
                  widget.pathImage,
                  color: Color.fromARGB(255, 220, 220, 222),
                ),
                onPressed: null,
              ),
            ),
          )
        : Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(58),
              color: const Color(0xff8C81FE),
            ),
            child: Center(
              child: IconButton(
                icon: Image.asset(widget.pathImage),
                onPressed: () {
                  if (widget.view != "") {
                    Navigator.pushReplacementNamed(context, widget.view);
                    //Navigator.of(context).pushReplacementNamed(widget.view);
                  }
                },
              ),
            ),
          );
    final textDescription = disableModules(widget.view, constDisableModules) &&
            tagEnvironment == Environment.PROD
        ? Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.nameDescription,
              style: const TextStyle(
                  color: const Color(0xffB1B4C7),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ))
        : Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.nameDescription,
              style: const TextStyle(
                  color: Color(0xff8A7FFD),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [elipseBtn, textDescription],
    );
  }
}
