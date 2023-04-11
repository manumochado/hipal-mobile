import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/onboardingWallet/bloc/register_cubit.dart';
import 'package:hipal/components/onboardingWallet/ui/widgets/register_screen/step_five_register.dart';
import 'package:hipal/components/onboardingWallet/ui/widgets/register_screen/step_three_register.dart';

import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';
import '../widgets/indicator.dart';
import '../widgets/register_screen/step_fours_register.dart';
import '../widgets/register_screen/step_one_register.dart';
import '../widgets/register_screen/step_six_register.dart';
import '../widgets/register_screen/step_two_register.dart';

class RegisterWalletScreen extends StatefulWidget {
  @override
  _RegisterWalletScreenState createState() => _RegisterWalletScreenState();
}

class _RegisterWalletScreenState extends State<RegisterWalletScreen> {
  String gender = "cedula";
  bool hipalCheck = false;
  bool dingCheck = false;
  //Controller text capture
  final nombres = TextEditingController();
  final apellidos = TextEditingController();
  final numero_cedula = TextEditingController();
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
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      final listTitle = [
        'Revisa y completa tus datos \n personales',
        'Registra tu número celular',
        'Activa tu billetera',
        'Conoce y activa las \n condiciones del servicio',
        'Conoce tu usuario y crea una clave',
        'Proceso exitoso'
      ];
      return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return Future.value(true);
          },
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                  controller: _HideBottomAppBarController,
                  child: Column(
                    children: [
                      ContainerBilleteraHeader(
                        size: size,
                        title: listTitle[state.step],
                      ),
                      SizedBox(height: size.height / 20),
                      StepIndicator(step: state.step),
                      if (state.step == 0)
                        StepOneRegister(
                            size: size,
                            nextStep: () {
                              setState(() {
                                _isVisible = true;
                              });
                              BlocProvider.of<RegisterCubit>(context)
                                  .stepChanged();
                            }),
                      if (state.step == 1)
                        StepTwoRegister(
                            size: size,
                            nextStep: () {
                              setState(() {
                                _isVisible = true;
                              });
                              BlocProvider.of<RegisterCubit>(context)
                                  .stepChanged();
                            }),
                      if (state.step == 2)
                        StepThreeRegister(
                            size: size,
                            nextStep: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .stepChanged();
                            }),
                      if (state.step == 3)
                        StepFoursRegister(
                            size: size,
                            nextStep: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .stepChanged();
                            },
                            nombres: nombres),
                      if (state.step == 4)
                        StepFiveRegister(
                            nombres: nombres,
                            size: size,
                            nextStep: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .stepChanged();
                            }),
                      if (state.step == 5)
                        StepSixRegister(
                            nombres: nombres,
                            nextStep: () {
                              Navigator.pushReplacementNamed(
                                  context, 'loginWallet');
                            },
                            size: size),
                      SizedBox(
                        height: 80.0,
                      ),
                    ],
                  )),
              bottomNavigationBar:
                  _isVisible ? BottonNavigationWallet() : Container(),
              extendBody: true,
            ),
          ));
    });
  }
}
