import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/user/ui/screens/widgets/appbar_stack.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreen createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child:
            BlocBuilder<UserBloc, UserState>(buildWhen: (previousState, state) {
          if (state.userEdit) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, state) {
          return AppBarStack(
            title: state.title,
            pageBack: 'dashboard',
          );
        }));
  }
}
