import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:toast/toast.dart';

import '../../../../../services/notification_service.dart';
import '../../../../commonZones/ui/widgets/btn_step.dart';

class StepFoursRegister extends StatefulWidget {
  const StepFoursRegister({
    Key? key,
    required this.nombres,
    required this.size,
    required this.nextStep,
  }) : super(key: key);

  final TextEditingController nombres;
  final Size size;
  final VoidCallback nextStep;

  @override
  State<StepFoursRegister> createState() => _StepFoursRegisterState();
}

class _StepFoursRegisterState extends State<StepFoursRegister> {
  bool hipalCheck = false;
  bool dingCheck = false;
  bool dingCheckOthers = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20.0),
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
          child: Row(children: [
            Icon(Icons.info_outline_rounded, color: "#7E72FF".toColor()),
            SizedBox(
              width: 5.0,
            ),
            RichText(
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
                          'Las condiciones marcadas con (*) son obligatorias'),
                ],
              ),
            )
          ])),
      Container(
          padding: EdgeInsets.only(left: 14.0, top: 10.0),
          child: FlatButton(
              height: 15.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () => setState(() => hipalCheck = !hipalCheck),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                    height: 12.0,
                    width: 24.0,
                    child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: "#7E72FF".toColor(),
                        value: hipalCheck,
                        onChanged: (value) {
                          setState(() => hipalCheck = value!);
                        })),
                SizedBox(width: 10.0),
                Text("Reglamento de Dépositos Electrónicos *",
                    style: TextStyle(
                        color: "#7E72FF".toColor(),
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        fontSize: 12.0))
              ]))),
      Padding(
          padding: EdgeInsets.only(left: 70.0, top: 5.0, right: 50.0),
          child: RichText(
            softWrap: true,
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(
                color: "#343887".toColor(),
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
              children: [
                TextSpan(text: 'Conoces y aceptas el reglamento de Depósito'),
                TextSpan(
                    text: 'Electrónico de Ding, ten en cuenta que aquí te'),
                TextSpan(
                    text: 'indicamos todo lo que necesitas saber sobre cómo'),
                TextSpan(
                    text:
                        'funciona tu depósito y como debes manejar tu dinero.'),
              ],
            ),
          )),
      Container(
          padding: EdgeInsets.only(left: 14.0, top: 15.0),
          child: FlatButton(
              height: 15.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () => setState(() => dingCheck = !dingCheck),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                    height: 12.0,
                    width: 24.0,
                    child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: "#7E72FF".toColor(),
                        value: dingCheck,
                        onChanged: (value) {
                          setState(() => dingCheck = value!);
                        })),
                SizedBox(width: 10.0),
                Text("Tratamiento de Datos Vinculados con Ding *",
                    style: TextStyle(
                        color: "#7E72FF".toColor(),
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        fontSize: 12.0))
              ]))),
      Padding(
          padding: EdgeInsets.only(left: 70.0, right: 50.0, top: 5.0),
          child: RichText(
            softWrap: true,
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(
                color: "#343887".toColor(),
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
              children: [
                TextSpan(
                    text:
                        'Nos autorizas a usar tus datos de forma responsable '),
                TextSpan(
                    text:
                        'y compartir con nuestros aliados, quienes nos ayudas'),
                TextSpan(text: 'a prestarte un mejor servicio.'),
              ],
            ),
          )),
      Container(
          padding: EdgeInsets.only(left: 14.0, top: 15.0),
          child: FlatButton(
              height: 15.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () =>
                  setState(() => dingCheckOthers = !dingCheckOthers),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                    height: 12.0,
                    width: 24.0,
                    child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: "#7E72FF".toColor(),
                        value: dingCheckOthers,
                        onChanged: (value) {
                          setState(() => dingCheckOthers = value!);
                        })),
                SizedBox(width: 10.0),
                Text("Tratamiento de Datos Vinculados con Ding *",
                    style: TextStyle(
                        color: "#7E72FF".toColor(),
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        fontSize: 12.0))
              ]))),
      Padding(
          padding: EdgeInsets.only(left: 70.0, right: 50.0, top: 5.0),
          child: RichText(
            softWrap: true,
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(
                color: "#343887".toColor(),
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
              children: [
                TextSpan(
                    text:
                        'Nos autorizas a usar tus datos con la finalidad de '),
                TextSpan(
                    text:
                        'ofrecerte promociones, alianzas comerciales, nuevos'),
                TextSpan(
                    text:
                        'productos, y recibir notificaciones, brindándote un'),
                TextSpan(text: 'mejor servicio.'),
              ],
            ),
          )),
      SizedBox(
        height: 20.0,
      ),
      BtnStep(
          label: "Autorizo",
          navigation: () {
            if (dingCheckOthers && dingCheck && hipalCheck) {
              return widget.nextStep();
            } else {
              NotificationService.showToast(context,
                  gravity: Toast.top,
                  message:
                      "Acepte las condiciones marcadas con (*) para continuar");
            }
          }),
    ]);
  }
}
