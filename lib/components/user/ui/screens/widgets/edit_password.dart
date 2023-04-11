import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/services/notification_service.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../bloc/user_bloc.dart';

class EditPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editPassword();
  }
}

class _editPassword extends State<EditPasswordScreen> {
  bool hidenCurrentPassword = true;
  bool hidenpassword1 = true;
  bool hidenpassword2 = true;
  bool isLoading = false;
  final controllerCurrentPass = TextEditingController();
  final controllerpass1 = TextEditingController();
  final controllerpass2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    controllerCurrentPass.dispose();
    controllerpass1.dispose();
    controllerpass2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffF9FAFE),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Cambiar contraseña',
          style: TextStyle(color: Color(0xFF343887)),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Color(0xFF8075FB),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "user");
          },
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  _currentPasswordField(),
                  _passwordField(),
                  _passwordConfirmField(),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: _buttonsubmit(context),
                  ),
                ],
              ))),
    );
  }

  Widget _currentPasswordField() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11.0),
              topRight: Radius.circular(11.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(right: 5, left: 10),
          child: TextFormField(
            obscureText: hidenCurrentPassword,
            controller: controllerCurrentPass,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecorations.authInputDecoration(
              hintText: '*****',
              labelText: 'Contraseña actual',
              prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
              suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  icon: hidenCurrentPassword
                      ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                          color: Color(0xff8176FB))
                      : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                          color: Color(0xffBFBDD4)),
                  onPressed: () {
                    setState(() {
                      hidenCurrentPassword = !hidenCurrentPassword;
                    });
                  }),
            ),
            validator: (value) => (value!.length >= 6) ? null : '',
          ),
        ));
  }

  Widget _passwordField() {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color.fromARGB(19, 119, 115, 158),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 2),
          )
        ]),
        child: Padding(
          padding: EdgeInsets.only(right: 5, left: 10),
          child: TextFormField(
            obscureText: hidenpassword1,
            controller: controllerpass1,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecorations.authInputDecoration(
              hintText: '*****',
              labelText: 'Contraseña Nueva',
              prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
              suffixIcon: Container(
                width: 90,
                child: IconButton(
                    padding: EdgeInsets.all(2),
                    icon: hidenpassword1
                        ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                            color: Color(0xff8176FB))
                        : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffBFBDD4)),
                    onPressed: () {
                      setState(() {
                        hidenpassword1 = !hidenpassword1;
                      });
                    }),
              ),
            ),
            validator: (value) => (value!.length >= 6) ? null : '',
          ),
        ));
  }

  Widget _passwordConfirmField() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11.0),
              bottomRight: Radius.circular(11.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(right: 5, left: 10),
          child: TextFormField(
            autocorrect: false,
            controller: controllerpass2,
            obscureText: hidenpassword2,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Confirmar Contraseña',
                prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
                suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: hidenpassword2
                        ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                            color: Color(0xff8176FB))
                        : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffBFBDD4)),
                    onPressed: () {
                      setState(() {
                        hidenpassword2 = !hidenpassword2;
                      });
                    })),
            validator: (value) => (value!.length >= 6) ? null : '',
          ),
        ));
  }

  Widget _buttonsubmit(context) {
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
            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 18),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              isLoading
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : Text(
                      'Cambiar contraseña',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ]),
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
        onPressed: () async {
          if (!isLoading) {
            if (!_formKey.currentState!.validate()) return;
            if (controllerpass1.text != controllerpass2.text) {
              await NotificationService.showDialogHeipal(
                  context,
                  json.encode({
                    'title': "Contraseñas incorrectas",
                    'message': "Las contraseñas no coinciden"
                  }));
              return;
            }
            setState(() {
              isLoading = !isLoading;
            });
            final userService = BlocProvider.of<UserBloc>(context);
            final params = {
              "currentPassword": controllerCurrentPass.text,
              "newPassword": controllerpass2.text,
            };

            final dynamic response;
            response =
                await userService.userRepo.changePasswordUser(context, params);
            if (response != null &&
                (response.statusCode == 200 || response.statusCode == 201)) {
              _onAlertWithCustomContentPressed(context);
            }
            setState(() {
              controllerCurrentPass.text = "";
              controllerpass1.text = "";
              controllerpass2.text = "";
              isLoading = !isLoading;
            });
          }
        });
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
            context: context,
            content: _confirmPopup(context),
            style: AlertStyle(isButtonVisible: false, isCloseButton: false))
        .show();
  }

  _confirmPopup(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 95.0,
            width: 117.0,
            child: ClipRRect(
                child: Image.asset(
              "assets/images/ok_check.png",
              isAntiAlias: true,
              fit: BoxFit.fill,
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              "La contraseña fue cambiada exitosamente",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton("Cerrar",
            () => {Navigator.pushReplacementNamed(context, "user")}, null)
      ],
    );
  }
}
