import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 53.0, left: 30.0, right: 28.0, bottom: 70.0),
      child: Column(
        children: [
          _title(),
          Container(
            margin: EdgeInsets.only(top: 23.0, bottom: 38.0),
            child: Text(
              "Actualiza tu contraseña y mantén tu cuenta segura.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5C5D87),
              ),
            ),
          ),
          _buttonSetPassword(context),
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 111, 250, 0.55),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            const IconData(
              0xe926,
              fontFamily: 'icomoon',
            ),
            color: Colors.white,
            size: 22.0,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        const Text(
          'Información de seguridad',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buttonSetPassword(context) {
    return MaterialButton(
        color: Color(0xFF776BF8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: Color(0xff7E72FF),
          ),
        ),
        elevation: 0,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Cambiar contraseña',
              style: TextStyle(color: Colors.white, fontSize: 16),
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
            )),
        onPressed: () {
          Navigator.of(context, rootNavigator: true)
              .pushReplacementNamed("password-user");
        });
  }
}
