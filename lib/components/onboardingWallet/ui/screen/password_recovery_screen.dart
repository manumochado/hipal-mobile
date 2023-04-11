import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class PasswordRecoveryWallet extends StatefulWidget {
  const PasswordRecoveryWallet({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryWalletState createState() => _PasswordRecoveryWalletState();
}

class _PasswordRecoveryWalletState extends State<PasswordRecoveryWallet> {
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
                      Text('Recupera tu contraseña',
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
                                      'Ingresa tu correo electrónico o número de '),
                              TextSpan(text: 'télefono para buscar tu cuenta.'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 30.0),
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (value) {},
                          autocorrect: false,
                          cursorColor: "#9FA7B8".toColor(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: "#9FA7B8".toColor(),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: "#9FA7B8".toColor(),
                              ),
                              labelText: '',
                              hintText: "Correo electrónico o celular",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: "#9FA7B8".toColor(),
                              focusColor: "#9FA7B8".toColor(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: "#9FA7B8".toColor()),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle:
                                  TextStyle(color: "#9FA7B8".toColor())),
                        ),
                      ),
                      BtnStep(
                        label: "Busca tu cuenta",
                        navigation: () {
                          Navigator.pushReplacementNamed(
                              context, 'recoveryWalletOne');
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
