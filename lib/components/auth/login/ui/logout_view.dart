import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      BlocProvider.of<LoginBloc>(context).loginRepo.logout(context);
      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: SizedBox(
              height: 95.0,
              width: 117.0,
              child: ClipRRect(
                  child: Image.asset(
                "assets/images/ok_check.png",
                isAntiAlias: true,
                fit: BoxFit.fill,
              )),
            )),
            Flexible(
                child: Text(
              "Sesión cerrada con éxito",
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            )),
            Flexible(
                child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: TextButton(
                style: ButtonStyle(
                    //foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Text(
                  'Volver a iniciar sesión',
                  style: TextStyle(
                    color: Color(0xFF6C7192),
                  ),
                ),
              ),
            ))
          ],
        ),
      );
    });
  }
}
