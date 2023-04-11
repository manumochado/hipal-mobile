import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';

class PasswordRecoveryApp extends StatefulWidget {
  const PasswordRecoveryApp({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryAppState createState() => _PasswordRecoveryAppState();
}

class _PasswordRecoveryAppState extends State<PasswordRecoveryApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return Future.value(true);
        },
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                body: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0, 0.5),
                        colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/Hi_globo.svg',
                          width: 100, semanticsLabel: 'Hipal Logo'),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Text('Código del edificio',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: "#343887".toColor(),
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                    child: RichText(
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
                                  'Ingresa el código asignado por la administración '),
                          TextSpan(
                              text:
                                  'de tu conjunto para ingresar a tu usuario.'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 20.0),
                    child: Row(
                      children: [
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: "#7E72FF".toColor(),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Verification Code"),
                                    content: Text(
                                        'Code entered is $verificationCode'),
                                  );
                                });
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  BtnStep(
                    label: "Reenviar código",
                    navigation: () {},
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  BtnStep(
                    label: "Continuar",
                    navigation: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                        height: 250,
                                        width: double.maxFinite,
                                        margin: EdgeInsets.only(top: 35.0),
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                top: 35.0, left: 25, right: 25),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 10.0,
                                                    width: 70.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          "#9FA7B8".toColor(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  Text(
                                                    "Es usted residente del edificio:",
                                                    style: TextStyle(
                                                        color:
                                                            "#343887".toColor(),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Text(
                                                    " Nilo Alejandria PH",
                                                    style: TextStyle(
                                                        color:
                                                            "#343887".toColor(),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 30.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      BtnStep(
                                                        label: "Cancelar",
                                                        navigation: () {},
                                                        width: 150.0,
                                                      ),
                                                      BtnStep(
                                                        label: "Confirmar",
                                                        navigation: () {
                                                          Navigator
                                                              .pushReplacementNamed(
                                                                  context,
                                                                  'informationOnboardingAppHipal');
                                                        },
                                                        width: 150.0,
                                                      ),
                                                    ],
                                                  ),
                                                ])))
                                  ]));
                    },
                    width: 200.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: "#7E72FF".toColor(),
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30.0,
                  )
                ])))));
  }
}
