import 'package:flutter/material.dart';

import 'design_text_add.dart';


// ignore: must_be_immutable
class ListAddService extends StatelessWidget {
  String title;
  bool flagLine;
  bool flagBtn;
  ListAddService(  this.title,  this.flagLine, this.flagBtn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DesignTextAdd(title),
        //Visibility( visible: flagLine, child: BorderLineProperty()),
      ],
    );
  }
}
