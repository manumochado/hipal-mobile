import 'package:flutter/material.dart';

class CardGeneral extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final String? subtitle;
  final String? type;
  final String? buttonText;
  final IconData? icon;
  final String? navigate;
  final bool? isEnabled;

  const CardGeneral({
    Key? key,
    required this.context,
    this.title,
    this.subtitle,
    this.type = '',
    this.buttonText,
    this.icon,
    this.navigate,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _title(),
      subtitle: _subtitle(),
      trailing: _trailing(),
    );
  }

  Text _title() => Text(
        title.toString(),
        style: const TextStyle(
          color: Color(0xff9FA7B8),
          fontSize: 12,
        ),
      );

  Text _subtitle() => Text(
        subtitle.toString(),
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Color(0xff343887),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      );

  Column _trailing() =>
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        if (type == 'button') _buttonAction(),
        if (type == 'icon') _iconAction(),
      ]);

  MaterialButton _buttonAction() => MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(
            color: Color(0xff7E72FF),
          ),
        ),
        color: const Color(0xFF776BF8),
        child: Container(
          height: 35,
          width: 64,
          alignment: Alignment.center,
          child: Text(
            buttonText.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isEnabled! ? Color(0xffFFFFFF) : Color(0xff7E72FF),
              fontSize: 12,
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: isEnabled!
                ? [
                    BoxShadow(
                      color: const Color(0xff7B6FFA).withOpacity(0.34),

                      spreadRadius: 0,
                      blurRadius: 9,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ]
                : null,
          ),
        ),
        onPressed: isEnabled!
            ? () {
                Navigator.pushReplacementNamed(context, navigate.toString());
              }
            : null,
      );

  MaterialButton _iconAction() => MaterialButton(
        minWidth: 10.0,
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        color: const Color(0xFF776BF8),
        child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Color(0xffffffff),
            size: 25,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff7B6FFA).withOpacity(0.34),

                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, navigate.toString());
        },
      );
}
