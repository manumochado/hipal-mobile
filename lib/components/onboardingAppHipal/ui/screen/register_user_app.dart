import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/auth/login/bloc/login_bloc.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/widgets/widgets.dart';

import '../../../apartment/ui/widgets/build_text_field.dart';

class RegisterAppScreen extends StatefulWidget {
  const RegisterAppScreen({Key? key}) : super(key: key);

  @override
  _RegisterAppScreen createState() => _RegisterAppScreen();
}

class _RegisterAppScreen extends State<RegisterAppScreen> {
  final String tagEnvironment = Environment().config.TagEnvironment;
  final _formKey = GlobalKey<FormState>();

  final nombre = TextEditingController();
  final email = TextEditingController();
  final celular = TextEditingController();
  final password = TextEditingController();
  var _passwordVisibleOne;
  var _passwordVisibleTwo;

  @override
  initState() {
    super.initState();
    _passwordVisibleOne = false;
    _passwordVisibleTwo = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenRegisterApp(context),
      backgroundColor: Color(0xffffffff),
    );
  }

  Widget _screenRegisterApp(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final storage = new FlutterSecureStorage();
        await storage.delete(key: 'statusLogged');
        await storage.delete(key: 'userLogged');
        await storage.delete(key: 'cookie');
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: ViewBackground(
          title: "Registro",
          isLogo: false,
          child: SingleChildScrollView(
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                height: size.height,
                width: size.width,
              ),
              CardContainer(padding: 0, child: Container()),
              _registerForm(),
              Positioned(
                  top: 245,
                  child: CircleAvatar(
                    backgroundColor: "#EFF1F3".toColor(),
                    radius: 40,
                    child: Icon(
                      Icons.camera_alt,
                      color: "#606060".toColor(),
                      size: 30.0,
                    ),
                  )),
            ]),
          )),
    );
  }

  Widget _registerForm() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                BuildFormFieldText(
                  controller: nombre,
                  label: 'Nombre',
                  hintText: 'Ingresar nombres y apellidos',
                ),
                BuildFormFieldText(
                  controller: nombre,
                  label: 'Celular',
                  hintText: 'Ingresar número celular',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contraseña",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: "#343887".toColor(),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0)),
                        TextFormField(
                          autofocus: false,
                          obscureText: !_passwordVisibleTwo,
                          onChanged: (value) {},
                          autocorrect: false,
                          cursorColor: "#9FA7B8".toColor(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: "#343887".toColor(),
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisibleOne
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: "#9FA7B8".toColor(),
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisibleOne = !_passwordVisibleOne;
                                  });
                                },
                              ),
                              labelText: 'Ingresar contraseña (8 dígitos min)',
                              hintText: "Ingresar contraseña (8 dígitos min)",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: "#9FA7B8".toColor(),
                              focusColor: "#9FA7B8".toColor(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: "#9FA7B8".toColor(), width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff8176FB), width: 2)),
                              labelStyle: TextStyle(
                                color: Color(0xff9FA7B8),
                              )),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Confirmar contraseña",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: "#343887".toColor(),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0)),
                        TextFormField(
                          autofocus: false,
                          obscureText: !_passwordVisibleTwo,
                          onChanged: (value) {},
                          autocorrect: false,
                          cursorColor: "#9FA7B8".toColor(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: "#343887".toColor(),
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisibleTwo
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: "#9FA7B8".toColor(),
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisibleTwo = !_passwordVisibleTwo;
                                  });
                                },
                              ),
                              labelText: 'Confirmar contraseña',
                              hintText: "Confirmar contraseña",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: "#9FA7B8".toColor(),
                              focusColor: "#9FA7B8".toColor(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: "#9FA7B8".toColor(), width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff8176FB), width: 2)),
                              labelStyle:
                                  TextStyle(color: "#9FA7B8".toColor())),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                  child: _buttonForm(context),
                )
              ])));
    });
  }

  Widget _buttonForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Color(0xff7E72FF),
            ),
          ),
          disabledColor: Color(0xFF776BF8),
          elevation: 0,
          color: Color(0xFF776BF8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registrarme',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
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
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) =>
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: size.height / 2,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: 35.0),
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 35.0, left: 25, right: 25),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 10.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: "#9FA7B8".toColor(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                    ),
                                    Text(
                                      "Procesando registro:",
                                      style: TextStyle(
                                          color: "#343887".toColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    RichText(
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: "#343887".toColor(),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Estamos procesando tu registro.'),
                                            ])),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    RichText(
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: "#343887".toColor(),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Tendrás acceso a tu cuenta una vez el '),
                                          TextSpan(
                                              text:
                                                  'administrador de tu conjunto haya '),
                                          TextSpan(
                                              text:
                                                  'verificado la información registrada.'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    RichText(
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            style: TextStyle(
                                              color: "#343887".toColor(),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Esto puede tardar unos minutos.'),
                                            ])),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, 'login');
                                        },
                                        child: Text(
                                          "¡Gracias por esperar!",
                                          style: TextStyle(
                                              color: "#343887".toColor(),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ])))
                    ]));
          });
    });
  }
}
