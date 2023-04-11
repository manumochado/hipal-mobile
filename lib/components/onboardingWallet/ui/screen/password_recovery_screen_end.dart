import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class PasswordRecoveryWalletEnd extends StatefulWidget {
  const PasswordRecoveryWalletEnd({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryWalletEndState createState() =>
      _PasswordRecoveryWalletEndState();
}

class _PasswordRecoveryWalletEndState extends State<PasswordRecoveryWalletEnd> {
  late ScrollController _HideBottomAppBarController;
  var _isVisible;
  var _passwordVisibleOne;
  var _passwordVisibleTwo;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _passwordVisibleOne = false;
    _passwordVisibleTwo = false;
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
                      Text('Cambiar contraseña',
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
                                      ' A continuación escribe tu contraseña para '),
                              TextSpan(text: 'restablecerla.'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: !_passwordVisibleOne,
                          onChanged: (value) {},
                          autocorrect: false,
                          cursorColor: "#9FA7B8".toColor(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: "#9FA7B8".toColor(),
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: "#9FA7B8".toColor(),
                              ),
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
                              labelText: 'Nueva contraseña',
                              hintText: "Nueva contraseña",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: "#9FA7B8".toColor(),
                              focusColor: "#9FA7B8".toColor(),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: "#9FA7B8".toColor()),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle:
                                  TextStyle(color: "#9FA7B8".toColor())),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: !_passwordVisibleTwo,
                          onChanged: (value) {},
                          autocorrect: false,
                          cursorColor: "#9FA7B8".toColor(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: "#9FA7B8".toColor(),
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: "#9FA7B8".toColor(),
                              ),
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
                              labelText: 'Confirmar nueva contraseña',
                              hintText: "Confirmar nueva contraseña",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: "#9FA7B8".toColor(),
                              focusColor: "#9FA7B8".toColor(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: "#9FA7B8".toColor()),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: const OutlineInputBorder(),
                              labelStyle:
                                  TextStyle(color: "#9FA7B8".toColor())),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      BtnStep(
                        label: "Cambiar contraseña",
                        navigation: () {},
                        width: 220.0,
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
