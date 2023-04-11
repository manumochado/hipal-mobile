import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../../apartment/ui/widgets/build_text_field.dart';
import '../../../../commonZones/ui/widgets/btn_step.dart';

class StepFiveRegister extends StatelessWidget {
  const StepFiveRegister(
      {Key? key,
      required this.nombres,
      required this.size,
      required this.nextStep,
      this.hipalCheck = false,
      this.dingCheck = false})
      : super(key: key);

  final TextEditingController nombres;
  final Size size;
  final VoidCallback nextStep;
  final bool hipalCheck;
  final bool dingCheck;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Tu usuario será tu número de celular:',
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: '#343887'.toColor(),
              fontWeight: FontWeight.w900,
              fontSize: 16.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '3002563781',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: '#8639D8'.toColor(),
              fontWeight: FontWeight.w900,
              fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        Container(
            padding: EdgeInsets.only(
                left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
            height: 80.0,
            width: size.width / 1.2,
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
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0),
                children: [
                  TextSpan(
                      text: 'Por favor crea tu clave y confirmala. Esta debe '),
                  TextSpan(
                      text:
                          'ser númerica y debe contener cuatro (4) dígitos no '),
                  TextSpan(text: 'consecutivos.'),
                ],
              ),
            ))),
        SizedBox(height: 20.0),
        BuildFormFieldText(
          controller: nombres,
          label: 'Clave',
          hintText: '****',
        ),
        SizedBox(height: 10.0),
        BuildFormFieldText(
          controller: nombres,
          label: 'Confirmar clave',
          hintText: '****',
        ),
        SizedBox(height: 20.0),
        BtnStep(label: "Continuar", navigation: nextStep),
      ],
    );
  }
}
