import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class ProcessWalletScreen extends StatefulWidget {
  @override
  _ProcessWalletScreenScreenState createState() =>
      _ProcessWalletScreenScreenState();
}

class _ProcessWalletScreenScreenState extends State<ProcessWalletScreen> {
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
            body: SingleChildScrollView(
                child: Column(
              children: [
                ContainerBilleteraHeader(
                  size: size,
                  title: 'Inicia tu proceso',
                ),
                SizedBox(height: size.height / 10),
                Container(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    height: 100.0,
                    width: size.width - 40,
                    decoration: BoxDecoration(
                      color: "#F2F0FA".toColor(),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(
                        child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          color: "#343887".toColor(),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  'Tu dinero siempre estará seguro gracias a nuestra alianza '),
                          TextSpan(
                              text:
                                  'con Ding, entidad vigilada por la Superintendencia '),
                          TextSpan(
                              text:
                                  'Financiera de Colombia, con la cual estarás aperturando '),
                          TextSpan(text: 'tu déposito electrónico.')
                        ],
                      ),
                    ))),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 2.0,
                  width: size.width - 100.0,
                  color: "#DFDDFD".toColor(),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Soy un propietario o arrendatario que \n '
                  'quiere pagar su administración.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: "#696989".toColor(),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30.0,
                ),
                BtnStep(
                    label: "Continuar",
                    navigation: () {
                      Navigator.pushReplacementNamed(
                          context, 'processInitialWallet');
                    })
              ],
            )),
            bottomNavigationBar: BottonNavigationWallet(),
            extendBody: true,
          ),
        ));
  }
}
