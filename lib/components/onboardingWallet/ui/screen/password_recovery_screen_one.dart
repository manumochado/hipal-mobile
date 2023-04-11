import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class PasswordRecoveryWalletOne extends StatefulWidget {
  const PasswordRecoveryWalletOne({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryWalletOneState createState() =>
      _PasswordRecoveryWalletOneState();
}

class _PasswordRecoveryWalletOneState extends State<PasswordRecoveryWalletOne> {
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
    String send = "email";
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
                      Text('Escoge el medio',
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
                                      'Selecciona el medio al cual prefieres que te '),
                              TextSpan(
                                  text: 'enviemos el código de recuperación.'),
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
                            Radio(
                              value: "email",
                              groupValue: send,
                              activeColor: "#7E72FF".toColor(),
                              onChanged: (value) {
                                setState(() {
                                  send = "email";
                                });
                              },
                            ),
                            Text(
                              'Enviar por correo electrónico: s**********2@gmail.com',
                              style: TextStyle(
                                  color: "#9FA7B8".toColor(),
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 5.0),
                        child: Row(
                          children: [
                            Radio(
                              value: "mobile",
                              groupValue: send,
                              activeColor: "#9FA7B8".toColor(),
                              onChanged: (value) {
                                setState(() {
                                  send = "mobile";
                                });
                              },
                            ),
                            Text(
                              'Enviar por mensaje de texto: *******3159  ',
                              style: TextStyle(
                                  color: "#9FA7B8".toColor(),
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      BtnStep(
                        label: "Enviar código",
                        navigation: () {
                          Navigator.pushReplacementNamed(
                              context, 'recoveryWalletTwo');
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
                      )
                    ])))));
  }
}
