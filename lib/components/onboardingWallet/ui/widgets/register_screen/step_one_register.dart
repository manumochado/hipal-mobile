import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/onboardingWallet/model/MunResponse.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../../apartment/ui/widgets/build_text_field.dart';
import '../../../../commonZones/ui/widgets/btn_step.dart';
import '../../../bloc/register_cubit.dart';
import '../../../model/cityResponse.dart';

class StepOneRegister extends StatefulWidget {
  StepOneRegister({
    Key? key,
    required this.size,
    required this.nextStep,
  }) : super(key: key);

  final Size size;
  final VoidCallback nextStep;

  @override
  State<StepOneRegister> createState() => _StepOneRegisterState();
}

class _StepOneRegisterState extends State<StepOneRegister> {
  //One step data //
  final GlobalKey<FormState> oneFormKey = new GlobalKey<FormState>();
  final TextEditingController nombres = new TextEditingController();
  final TextEditingController apellidos = new TextEditingController();
  final TextEditingController numeroCed = new TextEditingController();
  final TextEditingController fechaExp = new TextEditingController();
  final TextEditingController fechaNac = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController emailRep = new TextEditingController();
  //End data

  String gender = "F";
  String selectedValue = "Colombia";
  String selectedState = "";
  String selectedMun = "";
  List<String> itemsCountry = ['Colombia'];

  List<DropdownMenuItem<String>> dropdownItemsCountry(List<String> country) =>
      country
          .map(
            (country) => DropdownMenuItem(child: Text(country), value: country),
          )
          .toList();
  List<DropdownMenuItem<String>> dropdownItemsStates(
          List<CityResponse> states) =>
      states
          .map(
            (states) => DropdownMenuItem(
                child: Text(states.dpto ?? ""), value: states.codDepto ?? ""),
          )
          .toList();
  List<DropdownMenuItem<String>> dropdownItemsMun(List<MunResponse> mun) => mun
      .map(
        (mun) => DropdownMenuItem(
            child: Text(mun.nomMpio ?? ""), value: mun.codMpio),
      )
      .toList();
  late final RegisterCubit _registerCubit;
  @override
  void initState() {
    super.initState();
    _registerCubit = BlocProvider.of<RegisterCubit>(context);
    _registerCubit.loadState(context);
  }

  @override
  Widget build(BuildContext context) {
    List<CityResponse> stateList =
        context.watch<RegisterCubit>().state.stateList;
    List<MunResponse> munList = context.watch<RegisterCubit>().state.munList;
    return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (BuildContext context, state) {
      return Form(
          key: oneFormKey,
          child: Column(
            children: [
              BuildFormFieldText(
                controller: nombres,
                label: 'Nombres',
                hintText: 'Nombres',
                validate: (String? val) {
                  if (val!.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(val)) {
                    return "El nombre es requerido";
                  } else {
                    return null;
                  }
                },
              ),
              BuildFormFieldText(
                controller: apellidos,
                label: 'Apellidos',
                hintText: 'Apellidos',
                validate: (String? val) {
                  if (val!.isEmpty ||
                      !RegExp(r'^[a-zA-Z a-zA-Z]+$').hasMatch(val)) {
                    return "Los apellidos son requeridos";
                  } else {
                    return null;
                  }
                },
              ),
              BuildFormFieldText(
                controller: fechaNac,
                label: 'Fecha de nacimiento',
                hintText: 'dd/mm/aaaa',
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
              SizedBox(
                height: 5.0,
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
                            text: 'Recuerda que para aperturar tu depósito '),
                        TextSpan(text: 'electrónico debes ser mayor de edad.'),
                      ],
                    ),
                  ))),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: DropdownButtonFormField(
                    style: const TextStyle(
                        color: Color(0xff343887), //<-- SEE HERE
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      label: Text('País de nacimiento',
                          style: TextStyle(color: Color(0xFFA7A6F5))),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFA7A6F5), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFA7A6F5), width: 2.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFA7A6F5), width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Color(0xFFA7A6F5),
                    iconDisabledColor: Color(0xFFA7A6F5),
                    value: selectedValue,
                    onChanged: null,
                    items: dropdownItemsCountry(itemsCountry),
                  )),
              SizedBox(height: 20.0),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    style: const TextStyle(
                        color: Color(0xff343887),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      label: Text('Ciudad de nacimiento',
                          style: TextStyle(color: Color(0xFFA7A6F5))),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFA7A6F5), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFA7A6F5), width: 2.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFA7A6F5), width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Color(0xFFA7A6F5),
                    iconDisabledColor: Color(0xFFA7A6F5),
                    onChanged: (val) async {
                      setState(() {
                        selectedState = val as String;
                      });
                      await _registerCubit.loadMun(context, val as String);
                    },
                    items: dropdownItemsStates(stateList),
                  )),
              SizedBox(height: 20.0),
              if (!munList.isEmpty)
                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      style: const TextStyle(
                          color: Color(0xff343887),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        label: Text('Municipio de nacimiento',
                            style: TextStyle(color: Color(0xFFA7A6F5))),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFA7A6F5), width: 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFA7A6F5), width: 2.0),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFA7A6F5), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      iconEnabledColor: Color(0xFFA7A6F5),
                      iconDisabledColor: Color(0xFFA7A6F5),
                      onChanged: (val) {
                        setState(() {
                          selectedMun = val as String;
                        });
                      },
                      items: dropdownItemsMun(munList),
                    )),
              BuildFormFieldText(
                controller: address,
                label: 'Dirección',
                hintText: 'Dirección',
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La dirección es requerida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.0,
                  ),
                  Text('Género',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: "#343887".toColor(),
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 25.0,
                      ),
                      Radio(
                        value: "F",
                        groupValue: gender,
                        activeColor: "#7E72FF".toColor(),
                        onChanged: (value) {
                          setState(() {
                            gender = "F";
                          });
                        },
                      ),
                      Text(
                        'Femenino',
                        style: TextStyle(
                            color: "#696989".toColor(),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "M",
                        groupValue: gender,
                        activeColor: "#7E72FF".toColor(),
                        onChanged: (value) {
                          setState(() {
                            gender = "M";
                          });
                        },
                      ),
                      Text('Masculino',
                          style: TextStyle(
                              color: "#696989".toColor(),
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              BuildFormFieldText(
                controller: email,
                label: 'Correo electrónico',
                hintText: 'Correo electrónico',
                validate: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'El correo es requerido';
                  } else if (value != emailRep.value.text) {
                    return 'Los correos deben ser iguales';
                  }
                  return null;
                },
              ),
              BuildFormFieldText(
                controller: emailRep,
                label: 'Confirmar correo electrónico',
                hintText: 'Confirmar correo electrónico',
                validate: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'El correo es requerido';
                  } else if (value != email.value.text) {
                    return 'Los correos deben ser iguales';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              BtnStep(
                  label: "Continuar",
                  navigation: () {
                    if (oneFormKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context)
                          .addedInformationProfile(
                              nombres.value.text,
                              apellidos.value.text,
                              fechaNac.value.text,
                              gender,
                              email.value.text,
                              selectedState,
                              selectedMun,
                              address.value.text);
                      return widget.nextStep();
                    } else {}
                  }),
            ],
          ));
    });
  }
}
