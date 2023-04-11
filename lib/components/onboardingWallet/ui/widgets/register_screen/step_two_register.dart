import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../../apartment/ui/widgets/build_text_field.dart';
import '../../../../commonZones/ui/widgets/btn_step.dart';
import '../../../bloc/register_cubit.dart';

class StepTwoRegister extends StatefulWidget {
  const StepTwoRegister({
    Key? key,
    required this.size,
    required this.nextStep,
  }) : super(key: key);

  final Size size;
  final VoidCallback nextStep;

  @override
  State<StepTwoRegister> createState() => _StepTwoRegisterState();
}

class _StepTwoRegisterState extends State<StepTwoRegister> {
  final GlobalKey<FormState> twoFormKey = new GlobalKey<FormState>();
  final TextEditingController phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: twoFormKey,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                ),
                height: 60.0,
                width: widget.size.width / 1.2,
                decoration: BoxDecoration(
                  color: "#F2F0FA".toColor(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                    child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      color: "#343887".toColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                    ),
                    children: [
                      TextSpan(
                          text:
                              'Tu número de celular será tu cuenta, y lo necesitarás para '),
                      TextSpan(text: 'iniciar sesión y hacer transacciones.'),
                    ],
                  ),
                ))),
            SizedBox(
              height: 30.0,
            ),
            BuildFormFieldText(
              controller: phone,
              label: 'Ingresa tu número de celular',
              hintText: 'Número celular',
              validate: (String? val) {
                if (val!.isEmpty || !RegExp(r'^[0-9]{5,20}$').hasMatch(val)) {
                  return "El phone es requerido";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            BtnStep(
                label: "Confirmar",
                navigation: () {
                  if (twoFormKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context)
                        .addedPhone(phone.value.text);
                    return widget.nextStep();
                  }
                }),
          ],
        ));
  }
}
