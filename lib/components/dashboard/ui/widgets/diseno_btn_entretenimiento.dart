import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hipal/const.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/utils/general.dart';

// ignore: must_be_immutable
class DisenoBtnEntretenimiento extends StatefulWidget {
  String pathImage;
  String nameDescription;
  String view;
  int? notifications;
  DisenoBtnEntretenimiento({
    required this.nameDescription,
    required this.pathImage,
    required this.view,
    this.notifications = 0,
  });

  @override
  State<DisenoBtnEntretenimiento> createState() =>
      _DisenoBtnEntretenimientoState();
}

class _DisenoBtnEntretenimientoState extends State<DisenoBtnEntretenimiento> {
  final String tagEnvironment = Environment().config.TagEnvironment;

  @override
  Widget build(BuildContext context) {
    final disabled = disableModules(widget.view, constDisableModules) &&
        (tagEnvironment == Environment.PROD ||
            tagEnvironment == Environment.STAGING);

    final elipseBtn = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: disabled ? const Color(0xffE7E4FB).withOpacity(0.7) : const Color(0xffE7E4FB),
      ),
      child: Center(
        child: IconButton(
          icon: Image.asset(
            widget.pathImage,
            color: disabled ? Color(0xff8D81FD).withOpacity(0.3) : null,
          ),
          onPressed: disabled
              ? null
              : () {
                  if (widget.view != "") {
                    Navigator.pushReplacementNamed(context, widget.view);
                  }
                },
        ),
      ),
    );

    final textDescription = Flexible(
        child: Container(
      margin: EdgeInsets.only(left: 5),
      child: Text(widget.nameDescription,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: '#5c5d87'.toColor(),
              fontSize: 15,
              fontWeight: FontWeight.w600)),
    ));

    final badgeButtom = ((widget.notifications ?? 0) > 0 && !disabled)
        ? Badge(
            shape: BadgeShape.circle,
            position: BadgePosition.topEnd(end: -5),
            borderRadius: BorderRadius.circular(100),
            badgeColor: Color(0xffFE9D6D),
            padding: EdgeInsets.all(5.0),
            badgeContent: Text(widget.notifications.toString(),
                style: TextStyle(color: Color(0xffffffff), fontSize: 10.0)),
            child: elipseBtn,
          )
        : elipseBtn;

    return InkWell(
      onTap: disabled
          ? null
          : () {
              if (widget.view != "") {
                Navigator.pushReplacementNamed(context, widget.view);
              }
            },
      child: Row(
        children: [badgeButtom, textDescription],
      ),
    );
  }
}
