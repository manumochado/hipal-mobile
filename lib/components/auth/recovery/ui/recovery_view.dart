import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/services/notification_service.dart';

import 'package:hipal/widgets/widgets.dart';
import 'package:hipal/components/auth/recovery/bloc/recovery_bloc.dart';
import 'package:hipal/components/auth/recovery/variables/variables.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: BlocBuilder<RecoveryBloc, RecoveryState>(
              builder: (context, state) {
            return _screenRecovery();
          }),
          backgroundColor: Color(0xffffffff),
        ));
  }

  Widget _screenRecovery() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      final size = MediaQuery.of(context).size;

      return ViewBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.37),
            CardContainer(
                child: Column(
              children: [_recoveryForm()],
            )),
          ],
        ),
      ));
    });
  }

  Widget _recoveryForm() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                SizedBox(height: 20),
                _titleRecovery(),
                SizedBox(height: 20),
                _descriptionRecovery(),
                SizedBox(height: 30),
                if (state.step == 'email') _emailOrPhoneField(),
                if (state.step == 'profile') ...[
                  _typeSelect(context),
                  _btnBack('email'),
                ],
                if (state.step == 'code') ...[
                  _codeField(),
                  _btnBack('profile'),
                  _buttonSendAgainCode(),
                ],
                if (state.step == 'password') ...[
                  _passwordField(),
                  _passwordConfirmField(),
                  _btnBack('code'),
                ],
                SizedBox(height: 15),
                _buttonForm(),
                SizedBox(height: 20),
                _linkLogin(),
              ])));
    });
  }

  Widget _titleRecovery() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Text(
        titleData[state.step],
        style: TextStyle(
            color: Color(0xff343887),
            fontSize: 17,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      );
    });
  }

  Widget _descriptionRecovery() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Text(
        descriptionData[state.step],
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color(0xff5C5D87),
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
      );
    });
  }

  Widget _emailOrPhoneField() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
          width: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.0),
              color: Color(0xffF2F0FA),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: TextFormField(
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Correo electrónico o celular',
                  prefixIcon: const IconData(0xe902, fontFamily: 'icomoon')),
              onChanged: (value) =>
                  context.read<RecoveryBloc>().add(ChangeEmailOrPhone(value)),
            ),
          ));
    });
  }

  Widget _typeSelect(context) {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Column(children: [
        for (String item in radioButton)
          LabeledRadio(
              label: radioButtonData[item] + '' + state.hiddenFields[item],
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: item,
              groupValue: state.type,
              onChanged: (String newValue) {
                context.read<RecoveryBloc>().add(ChangeType(newValue));
              }),
      ]);
    });
  }

  Widget _codeField() {
    TextEditingController textEditingController = TextEditingController();
    StreamController<ErrorAnimationType>? errorController;

    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return PinCodeTextField(
        appContext: context,
        textStyle: TextStyle(
          color: Color(0xff343887),
        ),
        pastedTextStyle: TextStyle(
          color: Color(0xff7B6FFA),
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 3) {
            return "";
          } else {
            return null;
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: Color(0xff7B6FFA),
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: Colors.white,
          selectedFillColor: Color.fromARGB(101, 123, 111, 250),
          selectedColor: Color.fromARGB(101, 123, 111, 250),
        ),
        cursorColor: Color(0xff5C5D87),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        dialogConfig: DialogConfig(
            dialogTitle: 'Código Pegado',
            dialogContent: '¿Quieres pegar este código ',
            negativeText: 'Cancelar',
            affirmativeText: 'Pegar'),
        boxShadows: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onChanged: (value) =>
            context.read<RecoveryBloc>().add(ChangeCode(value)),
        beforeTextPaste: (text) {
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11.0),
                topRight: Radius.circular(11.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(19, 119, 115, 158),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: TextFormField(
              autocorrect: false,
              obscureText: state.isObscureText,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña Nueva',
                prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
                suffixIcon: IconButton(
                    icon: state.isObscureText
                        ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                            color: Color(0xff8176FB))
                        : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffBFBDD4)),
                    onPressed: () => context
                        .read<RecoveryBloc>()
                        .add(ChangeObscureText(!state.isObscureText))),
              ),
              onChanged: (value) => context
                  .read<RecoveryBloc>()
                  .add(ChangePassword(value.trim())),
              validator: (value) => state.isValidPassword ? null : '',
            ),
          ));
    });
  }

  Widget _passwordConfirmField() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.0),
                bottomRight: Radius.circular(11.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(19, 119, 115, 158),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: TextFormField(
              autocorrect: false,
              obscureText: state.obscureTextConfirm,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Confirmar Contraseña',
                prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
                suffixIcon: IconButton(
                    icon: state.obscureTextConfirm
                        ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                            color: Color(0xff8176FB))
                        : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffBFBDD4)),
                    onPressed: () => context.read<RecoveryBloc>().add(
                        ChangeObscureTextConfirm(!state.isObscureTextConfirm))),
              ),
              onChanged: (value) => context
                  .read<RecoveryBloc>()
                  .add(ChangePasswordConfirm(value.trim())),
              validator: (value) => state.isValidPasswordConfirm ? null : '',
            ),
          ));
    });
  }

  Widget _linkLogin() {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
        child: TextButton(
          onPressed: () {
            context.read<RecoveryBloc>().add(ChangeStep('email'));
            Navigator.pushReplacementNamed(context, 'login');
          },
          child: Text('Iniciar Sesión',
              style: const TextStyle(
                color: Color(0xff6C7192),
                fontSize: 14,
                fontStyle: FontStyle.normal,
              )),
        ),
      );
    });
  }

  Widget _btnBack(String step) {
    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return Container(
          child: TextButton(
        onPressed: () => {context.read<RecoveryBloc>().add(ChangeStep(step))},
        child: Text('Atrás',
            style: const TextStyle(
              color: Color(0xff6C7192),
              fontSize: 13,
              fontStyle: FontStyle.normal,
            )),
      ));
    });
  }

  Widget _buttonForm() {
    // ignore: unused_local_variable
    StreamController<ErrorAnimationType>? errorController;

    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
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
            width: 320.0,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isLoading)
                  Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                SizedBox(width: 5.0),
                Text(
                  state.isLoading ? 'Espere' : buttonData[state.step],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
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
          onPressed: state.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  // Validate Form
                  if (!_formKey.currentState!.validate()) return;

                  // Service Load
                  final recoveryService =
                      BlocProvider.of<RecoveryBloc>(context);
                  if (state.password != state.passwordConfirm) {
                    await NotificationService.showDialogHeipal(
                        context,
                        json.encode({
                          'title': "Contraseñas incorrectas",
                          'message': "Las contraseñas no coinciden"
                        }));
                    return;
                  }

                  // Loading true Form
                  context.read<RecoveryBloc>().add(ChangeLoading(true));

                  // Validar si el correo corresponde a un usuario
                  if (state.step == 'email') {
                    final dynamic responseAccount = await recoveryService
                        .recoveryRepo
                        .recoveryAccount(context, state.emailOrPhone);

                    if (responseAccount == null) {
                      // Loading false Form
                      context.read<RecoveryBloc>().add(ChangeLoading(false));
                      return;
                    }

                    final existsEmailorPhohe =
                        responseAccount['email'] != null ||
                            responseAccount['phone'] != null;

                    if (existsEmailorPhohe) {
                      context.read<RecoveryBloc>().add(ChangeStep('profile'));
                    }

                    String email = responseAccount['email'] ?? '';
                    String phone = responseAccount['phone'] ?? '';

                    context
                        .read<RecoveryBloc>()
                        .add(ChangeFieldsHidden(email, phone));
                  }

                  //Selecciona el medio para recibir el codigo de recuperacion
                  if (state.step == 'profile') {
                    // Send Code
                    final dynamic responseSendCode = await recoveryService
                        .recoveryRepo
                        .sendCode(context, state.emailOrPhone, state.type);

                    if (responseSendCode == null) {
                      // Loading false Form
                      context.read<RecoveryBloc>().add(ChangeLoading(false));
                      return;
                    }

                    if (responseSendCode['status'] == 'success') {
                      context.read<RecoveryBloc>().add(ChangeStep('code'));
                    }
                  }
                  //Valida que el codigo ingresado sea un codigo valido.
                  if (state.step == 'code') {
                    // Validate Code

                    if (state.code.length != 6) {
                      // errorController!.add(ErrorAnimationType.shake);
                    } else {
                      final dynamic responseValidateCode =
                          await recoveryService.recoveryRepo.validateCode(
                              context, state.emailOrPhone, state.code);

                      //Si el codigo no es valido detiene el proceso.
                      if (responseValidateCode == null) {
                        // Loading false Form
                        context.read<RecoveryBloc>().add(ChangeLoading(false));
                        return;
                      }

                      if (responseValidateCode['status'] == 'success')
                        context
                            .read<RecoveryBloc>()
                            .add(ChangeStep('password'));
                    }
                  }

                  //Se realiza el cambio de contraseña y envia a al login.
                  if (state.step == 'password') {
                    // Send New Password
                    final dynamic responsePassword =
                        await recoveryService.recoveryRepo.changePassword(
                            context,
                            state.emailOrPhone,
                            state.code,
                            state.password.trim());

                    //Si el codigo no es valido detiene el proceso.
                    if (responsePassword == null) {
                      // Loading false Form
                      context.read<RecoveryBloc>().add(ChangeLoading(false));
                      return;
                    }

                    if (responsePassword['_id'] != null)
                      context.read<RecoveryBloc>().add(ChangeStep('email'));
                    Navigator.pushReplacementNamed(context, 'login');
                  }

                  // Loading false Form
                  context.read<RecoveryBloc>().add(ChangeLoading(false));
                });
    });
  }

  Widget _buttonSendAgainCode() {
    // ignore: unused_local_variable
    StreamController<ErrorAnimationType>? errorController;

    return BlocBuilder<RecoveryBloc, RecoveryState>(builder: (context, state) {
      return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Color(0xff7E72FF),
              width: 2.0,
            ),
          ),
          disabledColor: Colors.white,
          color: Colors.white,
          child: Container(
            width: 320.0,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isLoadingSendCodeAgain)
                  Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Color(0xff343887),
                      strokeWidth: 3,
                    ),
                  ),
                SizedBox(width: 5.0),
                Text(
                  state.isLoadingSendCodeAgain
                      ? 'Enviando Nuevamente'
                      : buttonData['againCode'],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff343887), fontSize: 16),
                ),
              ],
            ),
          ),
          onPressed: state.isLoadingSendCodeAgain
              ? null
              : () async {
                  FocusScope.of(context).unfocus();

                  // Service Load
                  final recoveryService =
                      BlocProvider.of<RecoveryBloc>(context);

                  // Loading true Form
                  context
                      .read<RecoveryBloc>()
                      .add(ChangeLoadingSendCodeAgain(true));

                  // Send Code
                  final dynamic responseSendCode = await recoveryService
                      .recoveryRepo
                      .sendCode(context, state.emailOrPhone, state.type);

                  if (responseSendCode == null) {
                    // Loading false Form
                    context
                        .read<RecoveryBloc>()
                        .add(ChangeLoadingSendCodeAgain(false));
                    return;
                  }

                  // Loading false Form
                  context
                      .read<RecoveryBloc>()
                      .add(ChangeLoadingSendCodeAgain(false));
                });
    });
  }
}
