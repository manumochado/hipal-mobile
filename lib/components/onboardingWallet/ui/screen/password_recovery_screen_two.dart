import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class PasswordRecoveryWalletTwo extends StatefulWidget {
  const PasswordRecoveryWalletTwo({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryWalletTwoState createState() =>
      _PasswordRecoveryWalletTwoState();
}

class _PasswordRecoveryWalletTwoState extends State<PasswordRecoveryWalletTwo> {
  late ScrollController _HideBottomAppBarController;
  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = true;
    _HideBottomAppBarController = new ScrollController();
    _HideBottomAppBarController.addListener(() {
      if (_HideBottomAppBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_HideBottomAppBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
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
                bottomNavigationBar:
                    _isVisible ? BottonNavigationWallet() : Container(),
                extendBody: true,
                body: SingleChildScrollView(
                    controller: _HideBottomAppBarController,
                    child: Column(children: [
                      ContainerBilleteraHeader(
                        size: size,
                        title: "",
                      ),
                      SizedBox(height: size.height / 20),
                      Text('Código de seguridad',
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
                                      'Hemos enviado un código de 6 dígitos al medio '),
                              TextSpan(
                                  text:
                                      'seleccionado, por favor ingrese el código para '),
                              TextSpan(text: 'continuar.'),
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
                          Navigator.pushReplacementNamed(
                              context, 'recoveryWalletEnd');
                        },
                        width: 200.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: "#7E72FF".toColor(),
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      )
                    ])))));
  }
}
