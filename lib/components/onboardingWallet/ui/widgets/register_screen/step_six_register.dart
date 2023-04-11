import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../../commonZones/ui/widgets/btn_step.dart';

class StepSixRegister extends StatelessWidget {
  const StepSixRegister(
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
          '¡Ya tienes tu deposito electrónico',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: '#343887'.toColor(),
              fontWeight: FontWeight.w900,
              fontSize: 16.0),
        ),
        Text(
          'en tu billetera Hipal!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: '#343887'.toColor(),
              fontWeight: FontWeight.w900,
              fontSize: 16.0),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text(
          '111111111101',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: '#8639D8'.toColor(),
              fontWeight: FontWeight.w900,
              fontSize: 18.0),
        ),
        SizedBox(height: 40.0),
        Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: "#343887".toColor(),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
                children: [
                  TextSpan(text: 'Aquí podrás pagar tu administración, tus '),
                  TextSpan(text: 'cuotas extraordinarias, entre otros...'),
                ],
              ),
            )),
        SizedBox(
          height: 40.0,
        ),
        BtnStep(label: "Finalizar", navigation: nextStep),
      ],
    );
  }
}
