import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../commonZones/ui/widgets/btn_step.dart';

class InfoOnboardingApp extends StatefulWidget {
  const InfoOnboardingApp({Key? key}) : super(key: key);

  @override
  _InfoOnboardingAppState createState() => _InfoOnboardingAppState();
}

class _InfoOnboardingAppState extends State<InfoOnboardingApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String selectedTower = "T1";
    String selectedApart = "Apart 1";
    String selectedProperty = "Propietario";
    List<String> itemsTower = ['T1', 'T2', 'T3'];
    List<String> itemsProperty = [
      'Propietario',
      'Arrendatario',
    ];
    List<String> itemsApartament = ['Apart 1', 'Apart 2', 'Apart 3'];
    List<DropdownMenuItem<String>> dropdownItemsTower(List<String> country) =>
        country
            .map(
              (country) =>
                  DropdownMenuItem(child: Text(country), value: country),
            )
            .toList();
    List<DropdownMenuItem<String>> dropdownItemsProperty(List<String> states) =>
        states
            .map(
              (states) => DropdownMenuItem(child: Text(states), value: states),
            )
            .toList();
    List<DropdownMenuItem<String>> dropdownItemsApart(List<String> states) =>
        states
            .map(
              (states) => DropdownMenuItem(child: Text(states), value: states),
            )
            .toList();
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return Future.value(true);
        },
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                body: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0, 0.5),
                        colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/Hi_globo.svg',
                          width: 100, semanticsLabel: 'Hipal Logo'),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Text('Información del Inmueble',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: "#343887".toColor(),
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: "#343887".toColor(),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  'Ingresa si eres propietario o arrendatario, la torre '),
                          TextSpan(
                              text: 'y el apartamento; los cuales habitas.'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: DropdownButtonFormField(
                        style: const TextStyle(
                            color: Color(0xff343887), //<-- SEE HERE
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          label: Text('Propietario o arrendatario',
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
                        value: selectedProperty,
                        onChanged: null,
                        items: dropdownItemsProperty(itemsProperty),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: DropdownButtonFormField(
                        style: const TextStyle(
                            color: Color(0xff343887), //<-- SEE HERE
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          label: Text('Torre',
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
                        value: selectedTower,
                        onChanged: null,
                        items: dropdownItemsTower(itemsTower),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: DropdownButtonFormField(
                        style: const TextStyle(
                            color: Color(0xff343887), //<-- SEE HERE
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          label: Text('Apartamento',
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
                        value: selectedApart,
                        onChanged: null,
                        items: dropdownItemsApart(itemsApartament),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  BtnStep(
                    label: "Continuar",
                    navigation: () {
                      Navigator.pushReplacementNamed(
                          context, 'RegisterAppScreen');
                    },
                    width: 200.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: "#7E72FF".toColor(),
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30.0,
                  )
                ])))));
  }
}
