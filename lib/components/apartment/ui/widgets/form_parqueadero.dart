import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/input_decorations.dart';
import '../../bloc/property_cubit.dart';
import '../../model/ApartamentUpdate.dart';

class AparcamentoFormItemWidget extends StatefulWidget {
  AparcamentoFormItemWidget({
    required this.aparcamentoModel,
    required this.onRemove,
    this.index,
    Key? key,
  }) : super(key: key);

  final index;
  Parking aparcamentoModel;
  final Function onRemove;
  final state = _AparcamentoFormItemWidget();
  bool isValidated() => state.validate();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class _AparcamentoFormItemWidget extends State<AparcamentoFormItemWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget._nameController =
        new TextEditingController(text: widget.aparcamentoModel.name);
    widget._contactController = new TextEditingController(
        text: widget.aparcamentoModel.realEstateRegistration);
  }

  bool validate() {
    //Validate Form Fields by form key
    bool? validate = formKey.currentState?.validate() ?? false;
    if (validate) formKey.currentState?.save();
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(builder: (context, state) {
      return Material(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                              onPressed: () => widget.onRemove(),
                              child: Text(
                                "Eliminar",
                                style: TextStyle(color: Color(0xFF776BF8)),
                              )),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: widget._nameController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => widget.aparcamentoModel.name = value,
                    onSaved: (value) => widget.aparcamentoModel.name = value!,
                    validator: (value) =>
                    (value == null || value == '') ? '' : null,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: 'Número de parqueadero',
                        borderColor: Color(0xFFDFDDFD),
                        sizeLabel: 13),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: widget._contactController,
                    onChanged: (value) =>
                    widget.aparcamentoModel.realEstateRegistration = value,
                    onSaved: (value) =>
                    widget.aparcamentoModel.realEstateRegistration = value!,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('^([ ])')),
                    ],
                    validator: (value) =>
                    (value == null || value == '') ? '' : null,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: 'Matrícula del parqueadero',
                        borderColor: Color(0xFFDFDDFD),
                        sizeLabel: 13),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

