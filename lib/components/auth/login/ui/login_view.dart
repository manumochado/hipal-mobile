import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/auth/login/bloc/login_bloc.dart';
import 'package:hipal/const.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/utils/general.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends StatelessWidget {
  final String tagEnvironment = Environment().config.TagEnvironment;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return _screenLogin();
      }),
      backgroundColor: Color(0xffffffff),
    );
  }

  Widget _screenLogin() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      final size = MediaQuery.of(context).size;

      return WillPopScope(
        onWillPop: () async {
          final storage = new FlutterSecureStorage();
          await storage.delete(key: 'statusLogged');
          await storage.delete(key: 'userLogged');
          await storage.delete(key: 'cookie');
          SystemNavigator.pop();
          return Future.value(false);
        },
        child: ViewBackground(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.37),
              CardContainer(
                  child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    '¡Hola, ingresa tu cuenta!',
                    style: TextStyle(
                        color: Color(0xff343887),
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  _loginForm()
                ],
              )),
            ],
          ),
        )),
      );
    });
  }

  Widget _loginForm() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                if (state.step == 'email') ...[
                  _emailField(),
                  SizedBox(height: 1),
                  _passwordField(),
                ],
                if (state.step == 'profile') _profilesSelect(),
                SizedBox(height: 15),
                if (state.step == 'email') _recoveryPassword(),
                if (state.step == 'profile') _backAccount(),
                SizedBox(height: 25),
                _buttonForm(),
                SizedBox(height: 25),
                _termCondition(),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: disableModules(
                                'onboardingAppHipal', constDisableModules) &&
                            tagEnvironment == Environment.PROD
                        ? null
                        : () {
                            Navigator.pushReplacementNamed(
                                context, 'onboardingAppHipal');
                          },
                    child: Text("Acerca de",
                        style: TextStyle(
                            color: Color(0xff5C5D87),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800)))
              ])));
    });
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11.0),
                topRight: Radius.circular(11.0),
              ),
              color: Color(0xffF2F0FA),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Correo electrónico',
                  prefixIcon: const IconData(0xe902, fontFamily: 'icomoon')),
              onChanged: (value) =>
                  context.read<LoginBloc>().add(ChangeEmail(value)),
              validator: (value) => state.isValidEmail ? null : '',
            ),
          ));
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
            padding: EdgeInsets.only(right: 5, left: 10),
            child: TextFormField(
              autocorrect: false,
              obscureText: state.isObscureText,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: const IconData(0xe901, fontFamily: 'icomoon'),
                suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: state.isObscureText
                        ? Icon(const IconData(0xe900, fontFamily: 'icomoon'),
                            color: Color(0xff8176FB))
                        : Icon(const IconData(0xe903, fontFamily: 'icomoon'),
                            color: Color(0xffBFBDD4)),
                    onPressed: () => context
                        .read<LoginBloc>()
                        .add(ChangeObscureText(!state.isObscureText))),
              ),
              onChanged: (value) =>
                  context.read<LoginBloc>().add(ChangePassword(value)),
              validator: (value) => state.isValidPassword ? null : '',
            ),
          ));
    });
  }

  Widget _termCondition() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.all(24.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Al iniciar sesión aceptas nuestros\n",
                style: TextStyle(color: Color(0xff5C5D87)),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrlString(
                            'https://hipal.com.co/politica-terminos-y-condiciones');
                      },
                    text: "Términos & condiciones",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " y ",
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrlString(
                            'https://hipal.com.co/politica-datos-de-privacidad-hipal/');
                      },
                    text: "Política de datos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
          ));
    });
  }

  Widget _recoveryPassword() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        child: TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, 'recovery-password'),
          child: Text('¿Olvidaste tu contraseña?',
              style: const TextStyle(
                color: Color(0xff6C7192),
                fontSize: 14,
                fontStyle: FontStyle.normal,
              )),
        ),
      );
    });
  }

  Widget _backAccount() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        child: TextButton(
          onPressed: () => {
            context.read<LoginBloc>().add(ChangeProfile('')),
            context.read<LoginBloc>().add(ChangeStep('email'))
          },
          child: Text('Volver atrás',
              style: const TextStyle(
                color: Color(0xff6C7192),
                fontSize: 14,
                fontStyle: FontStyle.normal,
              )),
        ),
      );
    });
  }

  Widget _profilesSelect() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        child: Column(children: [
          for (dynamic item in state.radioProfilesButton)
            LabeledRadio(
              label: item['residential']['name'] +
                  "\n" +
                  item['apartment']['name'] +
                  " - " +
                  item['apartment']['tower']['name'],
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: item['_id'],
              groupValue: state.profile,
              onChanged: (String newValue) {
                context.read<LoginBloc>().add(ChangeProfile(newValue));
              },
            ),
        ]),
      );
    });
  }

  Widget _buttonForm() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
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
                  state.isLoading ? 'Espere' : 'Iniciar sesión',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
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
                  final loginService = BlocProvider.of<LoginBloc>(context);
                  // Loading true Form
                  context.read<LoginBloc>().add(ChangeLoading(true));

                  final dynamic response = await loginService.loginRepo.login(
                      context, state.email, state.password, state.profile);

                  if (response != null && response['status'] == 'loggedin') {
                    final storage = new FlutterSecureStorage();
                    storage.write(key: 'statusLogged', value: 'true');

                    Navigator.pushReplacementNamed(context, 'dashboard');
                    context.read<LoginBloc>().add(ChangeProfile(''));
                    context.read<LoginBloc>().add(ChangeStep('email'));
                    context.read<LoginBloc>().add(ResetForm('', ''));
                    context.read<LoginBloc>().add(ChangeLoading(false));
                  } else if (response != null &&
                      response['status'] == 'profiles') {
                    context.read<LoginBloc>().add(ChangeStep('profile'));
                    context
                        .read<LoginBloc>()
                        .add(ChangeProfilesRadio(response['profilesUsers']));
                  }

                  // Loading false Form
                  context.read<LoginBloc>().add(ChangeLoading(false));
                });
    });
  }
}
