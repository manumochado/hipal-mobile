import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/onboardingWallet/bloc/register_cubit.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:toast/toast.dart';

import '../../../../services/notification_service.dart';
import '../../../apartment/ui/widgets/build_text_field.dart';
import '../../../commonZones/ui/widgets/btn_step.dart';
import '../widgets/botton_navigation_wallet.dart';
import '../widgets/container_billetera-header.dart';

class TypeDocumentScreen extends StatefulWidget {
  @override
  _TypeDocumentScreenState createState() => _TypeDocumentScreenState();
}

class _TypeDocumentScreenState extends State<TypeDocumentScreen> {
  String typeDoc = "01";
  bool hipalCheck = false;
  bool dingCheck = false;
  final cedulaDate = TextEditingController();
  final noDoc = TextEditingController();
  final GlobalKey<FormState> docFormKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return Future.value(true);
          },
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                  child: Form(
                      key: docFormKey,
                      child: Column(
                        children: [
                          ContainerBilleteraHeader(
                            size: size,
                            title: 'Por favor, ingresa la siguiente \n '
                                'información de tu documento',
                          ),
                          SizedBox(height: size.height / 20),
                          Text('Tipo de documento',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: "#343887".toColor(),
                                fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                              )),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: "01",
                                        groupValue: typeDoc,
                                        activeColor: "#7E72FF".toColor(),
                                        onChanged: (value) {
                                          setState(() {
                                            typeDoc = "01";
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .typeDocChanged("01");
                                          });
                                        },
                                      ),
                                      Text(
                                        'Cédula de Ciudadania',
                                        style: TextStyle(
                                            color: "#696989".toColor(),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "02",
                                        groupValue: typeDoc,
                                        activeColor: "#7E72FF".toColor(),
                                        onChanged: (value) {
                                          setState(() {
                                            typeDoc = "02";
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .typeDocChanged("02");
                                          });
                                        },
                                      ),
                                      Text('NIT',
                                          style: TextStyle(
                                              color: "#696989".toColor(),
                                              fontWeight: FontWeight.w500))
                                    ],
                                  )
                                ],
                              )),
                          typeDoc == '01'
                              ? FormFieldCedulaScan(controller: noDoc)
                              : FormNitCedula(controller: noDoc),
                          if (typeDoc == '01')
                            BuildFormFieldText(
                              controller: cedulaDate,
                              label: 'Fecha de expedición de la cédula',
                              hintText: '10/10/2022',
                              validate: (val) {
                                try {
                                  List<String> arrayDate = val.split("/");
                                  if (arrayDate.length == 3 &&
                                      arrayDate[0].length == 2 &&
                                      arrayDate[1].length == 2 &&
                                      int.parse(arrayDate[0]) <= 31 &&
                                      int.parse(arrayDate[1]) <= 12 &&
                                      int.parse(arrayDate[2]) >= 1900) {
                                    return null;
                                  } else {
                                    return "El formato de la fecha es incorrecto";
                                  }
                                } catch (err) {
                                  return "";
                                }
                              },
                            ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 14.0, top: 15.0, bottom: 10.0),
                                  child: FlatButton(
                                      height: 15.0,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      onPressed: () => setState(
                                          () => hipalCheck = !hipalCheck),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 12.0,
                                                width: 24.0,
                                                child: Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor:
                                                        "#7E72FF".toColor(),
                                                    value: hipalCheck,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          hipalCheck = value!);
                                                    })),
                                            // You can play with the width to adjust your
                                            // desired spacing
                                            SizedBox(width: 10.0),
                                            Text(
                                                "Acepto compartir mi información con Hipal",
                                                style: TextStyle(
                                                    color: "#7E72FF".toColor(),
                                                    fontWeight: FontWeight.w800,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 12.0))
                                          ]))),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 14.0, bottom: 30.0),
                                  child: FlatButton(
                                      height: 15.0,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      onPressed: () => setState(
                                          () => dingCheck = !dingCheck),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 12.0,
                                                width: 24.0,
                                                child: Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor:
                                                        "#7E72FF".toColor(),
                                                    value: dingCheck,
                                                    onChanged: (value) {
                                                      setState(() =>
                                                          dingCheck = value!);
                                                    })),
                                            // You can play with the width to adjust your
                                            // desired spacing
                                            SizedBox(width: 10.0),
                                            Text(
                                                "Acepto compartir mi información con Ding",
                                                style: TextStyle(
                                                    color: "#7E72FF".toColor(),
                                                    fontWeight: FontWeight.w800,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 12.0))
                                          ]))),
                            ],
                          ),
                          BtnStep(
                              label: "Confirmar",
                              navigation: () {
                                if (docFormKey.currentState!.validate() &&
                                    hipalCheck &&
                                    dingCheck) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .typeDocAddedAllData(
                                          typeDoc,
                                          noDoc.value.text,
                                          cedulaDate.value.text,
                                          true,
                                          true);
                                  Navigator.pushReplacementNamed(
                                      context, 'registerWallet');
                                } else {
                                  if (!hipalCheck || !dingCheck)
                                    NotificationService.showToast(context,
                                        gravity: Toast.top,
                                        message:
                                            "Acepte compartir su información para continuar");
                                }
                              }),
                          SizedBox(
                            height: 60.0,
                          )
                        ],
                      ))),
              bottomNavigationBar: BottonNavigationWallet(),
              extendBody: true,
            ),
          ));
    });
  }
}

class FormNitCedula extends StatelessWidget {
  FormNitCedula({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de documento',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: "#343887".toColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0)),
            TextFormField(
              controller: controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return "El número de documento es requerido";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff8176FB), width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff8176FB), width: 2)),
                  hintText: "",
                  labelText: "NIT o Cédula",
                  labelStyle: TextStyle(
                    color: Color(0xff9FA7B8),
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ],
        ));
  }
}

class FormFieldCedulaScan extends StatelessWidget {
  FormFieldCedulaScan({Key? key, required this.controller}) : super(key: key);
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de documento',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: "#343887".toColor(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0)),
            TextFormField(
              controller: controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return "El número de documento es requerido";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff8176FB), width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff8176FB), width: 2)),
                  hintText: "",
                  labelText: "Escanea o escribe tu cédula",
                  labelStyle: TextStyle(
                    color: Color(0xff9FA7B8),
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ],
        ));
  }
}
