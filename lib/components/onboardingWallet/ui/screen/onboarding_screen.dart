import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipal/utils/extension_color.dart';

import '../widgets/button_arrow.dart';
import '../widgets/card_image.dart';
import '../widgets/indicator_step.dart';

class OnboardingWalletScreen extends StatefulWidget {
  @override
  _OnboardingWalletScreenState createState() => _OnboardingWalletScreenState();
}

class _OnboardingWalletScreenState extends State<OnboardingWalletScreen> {
  int stepNumbers = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> title = [
      '¡Recarga tu cuenta!',
      '¡Paga tu administración!',
      '¡Y disfruta de muchos \n servicios más!'
    ];

    List<String> images = [
      "assets/images/onboarding1.png",
      "assets/images/onboarding2.png",
      "assets/images/onboarding3.png"
    ];
    List<bool> isLogo = [true, false, true];
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
                      }
                    });
                  } else if (dragEndDetails.primaryVelocity! > 0.0) {}
                },
                child: Column(
                  children: [
                    CardImage(
                        size: size,
                        image: images[stepNumbers],
                        showLogo: isLogo[stepNumbers],
                        extend: stepNumbers == 1 ? true : false),
                    SizedBox(
                      height: 60.0,
                    ),
                    Expanded(
                      child: Text(
                        title[stepNumbers],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: '#8639D8'.toColor(),
                            fontWeight: FontWeight.w900,
                            fontSize: 24.0),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  ],
                                )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'processWallet');
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
                                      setState(() {
                                        if (stepNumbers == 2) {
                                          Navigator.pushReplacementNamed(
                                              context, 'processWallet');
                                        } else if (stepNumbers == 1) {
                                          stepNumbers = 2;
                                        } else if (stepNumbers == 0) {
                                          stepNumbers = 1;
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
                )),
            extendBody: true,
          ),
        ));
  }
}
