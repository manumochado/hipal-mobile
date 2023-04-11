import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/auth/login/bloc/login_bloc.dart';
import 'package:hipal/const.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/utils/general.dart';

// ignore: must_be_immutable
class ListTitleMenu extends StatefulWidget {
  IconData? pathImage;
  String title;
  String view;
  ListTitleMenu(this.pathImage, this.title, this.view, {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ListTitleMenu> createState() =>
      _ListTitleMenuState(pathImage, title, view);
}

class _ListTitleMenuState extends State<ListTitleMenu> {
  IconData? pathImage;
  String title;
  String view;
  final String tagEnvironment = Environment().config.TagEnvironment;
  _ListTitleMenuState(this.pathImage, this.title, this.view);
  @override
  Widget build(BuildContext context) {
    return disableModules(view, constDisableModules) &&
            tagEnvironment == Environment.PROD
        ? _optionDisable()
        : _option();
  }

  Widget _option() {
    return Row(
      children: [
        if (this.pathImage != null)
          Container(
              height: 38,
              width: 38,
              margin: const EdgeInsets.only(left: 15, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xffF7F7FB),
              ),
              child: Icon(this.pathImage, color: Color(0xff7E72FF))),
        if (this.pathImage == null)
          Text(
            '>',
            style: TextStyle(color: Color(0xFF5C5D87)),
          ),
        TextButton(
          child: Text(title,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5C5D87))),
          onPressed: () {
            view == "logout"
                ? {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: const Text('Por favor confirme'),
                            content: const Text('¿Desea cerrar sesión?'),
                            actions: [
                              // The "Yes" button
                              TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    BlocProvider.of<LoginBloc>(context)
                                        .loginRepo
                                        .logout(context);
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamedAndRemoveUntil('login',
                                            (Route<dynamic> route) => false);
                                  },
                                  child: const Text('Si')),
                              TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No'))
                            ],
                          );
                        })
                  }
                : Navigator.of(context).pushReplacementNamed(view);
          },
        ),
      ],
    );
  }

  Widget _optionDisable() {
    return Row(
      children: [
        if (this.pathImage != null)
          Container(
              height: 38,
              width: 38,
              margin: const EdgeInsets.only(left: 15, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xffF7F7FB),
              ),
              child: Icon(this.pathImage, color: Color(0xffB1B4C7))),
        if (this.pathImage == null)
          Text(
            '>',
            style: TextStyle(color: Color(0xffB1B4C7)),
          ),
        TextButton(
          child: Text(title,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB1B4C7))),
          onPressed: null,
        ),
      ],
    );
  }
}
