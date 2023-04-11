import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user/bloc/user_bloc.dart';
import 'design_text_property.dart';

// ignore: must_be_immutable
class ListProperty extends StatelessWidget {
  String title;
  String value;
  bool flagLine;
  bool flagBtn;
  ListProperty(this.title, this.value, this.flagLine, this.flagBtn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc,UserState>(
        buildWhen: (previousState, state) {
          if(state.userEdit){
            return true;
          }
          else{
            return false;
          }
        },
        builder: (context, state){
          return Column(
            children: [
              DesignTextProperty(title, value , flagBtn, false),
            ],
          );
        }
    );
  }
}
