import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../onboardingWallet/ui/widgets/button_arrow.dart';
import '../../../onboardingWallet/ui/widgets/indicator_step.dart';

class OnboardingAppOne extends StatefulWidget {
  const OnboardingAppOne({Key? key}) : super(key: key);

  @override
  _OnboardingAppOneState createState() => _OnboardingAppOneState();
}

class _OnboardingAppOneState extends State<OnboardingAppOne> {
  int stepNumbers = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> title = [
      ' ¡Bienvenido a Hipal!',
      ' Aquí podrás: \n Publicar y dar a conocer tu  emprendimiento a la  comunidad.',
      ' Enterarte de toda \n la correspondencia que \n recibes en tiempo real a \n través del casillero virtual.',
      ' Conocer los horarios de \n tu administrador y su \n gestión.',
      ' Tener toda la información \n de tu apartamento en un \n ambiente digital y seguro.',
      ' ¡Y mucho más! \n ¿Empezamos?'
    ];

    List<String> images = [
      "assets/images/obAppOne.png",
      "assets/images/obAppTwo.png",
      "assets/images/obAppThree.png",
      "assets/images/obAppFours.png",
      "assets/images/obAppFive.png",
      "assets/images/obAppSix.png"
    ];

    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return Future.value(true);
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
                onHorizontalDragEnd: (dragEndDetails) {
                  if (dragEndDetails.primaryVelocity! < 0.0) {
                    setState(() {
                      if (stepNumbers == 0) {
                        stepNumbers = 1;
                      } else if (stepNumbers == 1) {
                        stepNumbers = 2;
                      } else if (stepNumbers == 2) {
                        stepNumbers = 3;
                      } else if (stepNumbers == 3) {
                        stepNumbers = 4;
                      } else if (stepNumbers == 4) {
                        stepNumbers = 5;
                      }
                    });
                  } else if (dragEndDetails.primaryVelocity! > 0.0) {}
                },
                child: Stack(children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    color: "#F9FAFB".toColor(),
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Container(color: "#F9FAFB".toColor()),
                      ),
                      Expanded(
                        flex: 60,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(50.0)),
                                boxShadow: [
                              BoxShadow(
                                  //offset: Offset(0, 4),
                                  color: Colors.grey.withOpacity(0.2), //edited
                                  spreadRadius: 2,
                                  blurRadius: 8 //edited
                                  )
                            ])),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 80.0),
                      Image.asset(images[stepNumbers]),
                      SizedBox(
                        height: 80.0,
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          title[stepNumbers],
                          textAlign: stepNumbers == 0
                              ? TextAlign.center
                              : TextAlign.start,
                          style: TextStyle(
                              color: '#374151'.toColor(),
                              fontWeight: FontWeight.w900,
                              fontSize: 24.0),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 40.0, right: 40.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 0 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 1 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 2 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 3 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 4 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      IndicatorStep(
                                          isActive:
                                              stepNumbers == 5 ? true : false),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                    ],
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, 'login');
                                    },
                                    child: Text(
                                      'saltar',
                                      style: TextStyle(
                                          color: '#9FA7B8'.toColor(),
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (stepNumbers == 5) {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              'recoveryOnboardingAppHipal');
                                        }
                                        setState(() {
                                          if (stepNumbers != 5) {
                                            stepNumbers++;
                                          }
                                        });
                                      },
                                      child: ButtonArrow()),
                                ],
                              ))),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  )
                ])),
            extendBody: true,
          ),
        ));
  }
}
