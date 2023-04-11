import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/user/ui/screens/widgets/form_edit_user.dart';

class EditUserScreen extends StatefulWidget {
  _EditUserScreen createState() => _EditUserScreen();
}

class _EditUserScreen extends State<EditUserScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "user");
      return Future.value(true);
    }, child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return FormEditUser(
        title: state.title,
        pageBack: 'user',
      );
    }));
  }
}
