import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../../apartment/ui/widgets/build_text_field.dart';
import '../../../../commonZones/ui/widgets/btn_step.dart';
import '../../../bloc/register_cubit.dart';
import 'counter_time.dart';

class StepThreeRegister extends StatefulWidget {
  const StepThreeRegister({
    Key? key,
    required this.size,
    required this.nextStep,
  }) : super(key: key);

  final Size size;
  final VoidCallback nextStep;

  @override
  State<StepThreeRegister> createState() => _StepThreeRegisterState();
}

class _StepThreeRegisterState extends State<StepThreeRegister> {
  late final RegisterCubit _registerCubit;
  @override
  void initState() {
    super.initState();
    _registerCubit = BlocProvider.of<RegisterCubit>(context);
    _registerCubit.sendOTPCode(context);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeOTP = new TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Por favor escribe el código de \nactivación que te enviaremos en un \nmensaje de texto.',
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: '#343887'.toColor(),
              fontWeight: FontWeight.w800,
              fontSize: 15.0),
        ),
        SizedBox(height: 20.0),
        BuildFormFieldText(
          controller: codeOTP,
          label: 'Código de activación',
          hintText: 'XXXXXX',
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountDownTimer(),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Si se te acaba el tiempo, \npuedes pedir un código \nnuevo',
              style: TextStyle(
                  color: "#343887".toColor(),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(height: 30.0),
        BtnStep(
            label: "Reenviar Código",
            width: 180.0,
            navigation: () {
              BlocProvider.of<RegisterCubit>(context).sendOTPCode(context);
            }),
        SizedBox(height: 10.0),
        BtnStep(label: "Confirmar", navigation: widget.nextStep),
      ],
    );
  }
}
