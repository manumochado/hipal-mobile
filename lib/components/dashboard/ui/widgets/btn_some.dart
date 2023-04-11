import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

import 'list_btn_some.dart';

class BtnSome extends StatefulWidget {
  const BtnSome({Key? key}) : super(key: key);

  @override
  State<BtnSome> createState() => _BtnSomeState();
}

class _BtnSomeState extends State<BtnSome> {
  @override
  Widget build(BuildContext context) {
    final txtNameEstado = Container(
      margin: const EdgeInsets.only(left: 24),
      child: const Text(
        'Tu estado de cuenta:',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xff343887),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
    final iconArrowBottom = Container(
        margin: const EdgeInsets.only(right: 6),
        child: Icon(
          Icons.arrow_downward_sharp,
          size: 20,
          color: '#fb4e57'.toColor(),
        ));
    final iconPrecio = Container(
      margin: const EdgeInsets.only(right: 21),
      child: Text(
        '\$450.000',
        style: TextStyle(
            color: '#fb4e57'.toColor(),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
    final ventanaEstado = Container(
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xffF3F1FA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [Expanded(child: txtNameEstado), iconArrowBottom, iconPrecio],
      ),
    );
    const txtNamepuntos = Text(
      'Mis puntos',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color(0xff82869D),
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
    final cantidadPts = Container(
      margin: const EdgeInsets.only(right: 27),
      height: 20,
      width: 77,
      decoration: BoxDecoration(
          color: const Color(0xffEEF8F5),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 4),
            child: Image(
              image: AssetImage('assets/images/iconGood.png'),
            ),
          ),
          Text(
            '378 Pts',
            style: TextStyle(
                color: Color(0xff5DA585),
                fontSize: 12,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
    final ventanaPuntos = Container(
      margin: const EdgeInsets.only(left: 32, top: 11),
      height: 15,
      color: Colors.transparent,
      child: Row(
        children: [const Expanded(child: txtNamepuntos), cantidadPts],
      ),
    );
    return Container(
        margin: const EdgeInsets.only(left: 14, right: 14),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: '#f6f7fe'.toColor(),
              blurRadius: 1,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            //ventanaEstado,
            //ventanaPuntos,
            const ListBtnSome(),
          ],
        ));
  }
}
