import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../widgets/input_decorations.dart';

typedef MyFunction = void Function(String);

class FormInputWidget extends StatelessWidget {
  const FormInputWidget({
    required this.controller,
    this.denyFormat = '^([ ])',
    this.labelText = '',
    this.readOnly = true,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String denyFormat;
  final String labelText;
  final MyFunction onChange;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
          controller: this.controller,
          keyboardType: TextInputType.name,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(this.denyFormat)),
          ],
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: this.labelText,
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13),
          validator: (value) => (value == null || value == '') ? '' : null,
          onChanged: (value) {
            this.onChange(value);
          },
          readOnly: this.readOnly),
    ));
  }
}
