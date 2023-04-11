import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/formpower_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/powers_bloc.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/assembly/model/power.dart';
import 'package:hipal/components/assembly/model/powerAssembly.dart';
import 'package:hipal/components/assembly/model/powerAssemblyM.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/user_info.dart';

import 'package:hipal/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PowerForm extends StatefulWidget {
  
  @override
  _PowerForm createState() => _PowerForm();
}

class _PowerForm extends State<PowerForm> {
  

  TextEditingController fullName = TextEditingController();
  TextEditingController numIdentification = TextEditingController();
  TextEditingController email = TextEditingController();
  String powerType = 'Seleccionar';
  String assemblyId = '';


  @override
  Widget build(BuildContext context) {

    String idUser = BlocProvider.of<UserBloc>(context).state.userInfo!.user!.id!;
    List<PowerAssemblyM> assemblies = BlocProvider.of<PowersBloc>(context).state.powerAssemblies ?? [];
    List<String> powerAssemblyString = assemblies.map((e) => e.assemblyName).toList().cast<String>();



    return BlocBuilder<FormpowerBloc, FormpowerState>(
        builder: (context, state) {
      return Scaffold(
          // controller: _refreshController,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff7D41DD),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/backarrow.png',
                            height: 50,
                            width: 50,
                          )),
                      Text(
                        'Poderes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 50,
                      )
                    ],
                  ),
                ),
          
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: '#7c43de'.toColor(),
                            ),
                          ),
          
                          
                          
                        ],
                      ),
                    ),
          
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    )
                  ],
                ),
          
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  height: 650,
                  child: ListView(
                    children: [
                      _infoUser(),
          
                      SizedBox(
                  height: 30,
                ),
          
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 40),
                  child: Text('Autorizo a:',
                    style: TextStyle(
                      color: '#343887'.toColor(),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )
                  ),
                ),
          
                SizedBox(
                  height: 10,
                ),
          
                Container(
                  width: 345,
                  height: 215,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.01,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11),
                  ),
          
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 72,
                        decoration: BoxDecoration(
                          color: '#f3f1fa'.toColor(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
          
                        child: Row(children: [
                          Image.asset(
                            'assets/images/mail.png',
                            height: 60,
                            width: 60,
                          ),
          
                          SizedBox(
                            width: 15,
                          ),
          
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre completo',
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    fontStyle: FontStyle.normal,
                                    color: '#9FA7B8'.toColor(),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Container(
                                  height: 27,
                                  width: 200,
                                  child: TextFormField(
                                    controller: fullName,
                                    decoration: InputDecoration(
                                      hintText: '...',
                                      hintStyle: TextStyle(
                                        fontFamily: 'inter',
                                        fontStyle: FontStyle.normal,
                                        color: '#5C5D87'.toColor(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        return 'Por favor ingrese su nombre completo';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                              
                            ),
                          ),
                        ]),
                        
                      ),
          
                      Container(
                        width: double.infinity,
                        height: 72,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: '#e5e5e5'.toColor(),
                              width: 1,
                            ),  
                          )
                        ),
          
                        child: Row(children: [
                          Image.asset(
                            'assets/images/lock.png',
                            height: 60,
                            width: 60,
                          ),
          
                          SizedBox(
                            width: 15,
                          ),
          
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nº de identificación',
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    fontStyle: FontStyle.normal,
                                    color: '#9FA7B8'.toColor(),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Container(
                                  height: 27,
                                  width: 200,
                                  child: TextFormField(
                                    controller: numIdentification,
                                    decoration: InputDecoration(
                                      hintText: '...',
                                      hintStyle: TextStyle(
                                        fontFamily: 'inter',
                                        fontStyle: FontStyle.normal,
                                        color: '#5C5D87'.toColor(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        return 'Por favor ingrese su nombre completo';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                              
                            ),
                          ),
                        ]),
                        
                      ),
          
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
          
                        child: Row(children: [
                          Image.asset(
                            'assets/images/mail.png',
                            height: 60,
                            width: 60,
                          ),
          
                          SizedBox(
                            width: 15,
                          ),
          
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Correo electrónico',
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    fontStyle: FontStyle.normal,
                                    color: '#9FA7B8'.toColor(),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Container(
                                  height: 27,
                                  width: 200,
                                  child: TextField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      hintText: '...',
                                      hintStyle: TextStyle(
                                        fontFamily: 'inter',
                                        fontStyle: FontStyle.normal,
                                        color: '#5C5D87'.toColor(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                              
                            ),
                          ),
                        ]),
                        
                      ),
                      
                                          
                    ]
                  ),
                ),
          
                SizedBox(
                  height: 30,
                ),
          
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 40),
                  child: Text('Poder para:',
                    style: TextStyle(
                      color: '#343887'.toColor(),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )
                  ),
                ),
          
                SizedBox(
                  height: 10,
                ),
          
                Container(
                  width: 345,
                  height: 57,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.01,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11),
                  ),
          
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset('assets/images/inter.png',
                            height: 60,
                            width: 60,
                          ),
          
                          SizedBox(
                            width: 15,
                          ),
          
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tipo de poder',
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    fontStyle: FontStyle.normal,
                                    color: '#9FA7B8'.toColor(),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Container(
                                  height: 27,
                                  width: 200,
                                  child: DropdownButton(
                                    items: powerAssemblyString
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.start,
                                        ),
                                      );
                                    }).toList(),
                                    iconSize: 0,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        powerType = newValue.toString();
                                        assemblyId = assemblies[powerAssemblyString.indexOf(newValue.toString())].sId;
                                      });
                                    },
                                    hint: Text(
                                      powerType,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                        ],
                      ),
          
                      
          
                      Image.asset(
                        'assets/images/arroup.png',
                        height: 20,
                        width: 20,
                      )
                      
                    ]
                  ),
                ),
          
                SizedBox(
                  height: 10,
                ),
          
                Container(
                  width: 345,
                  height: 87,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.01,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11),
                  ),
          
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
          
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Firma de quién entrega el poder:',
                          style: TextStyle(
                            fontFamily: 'inter',
                            fontStyle: FontStyle.normal,
                            color: '#343887'.toColor(),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
          
                        SizedBox(
                          height: 5,
                        ),
          
                        Stack(
                          children: [
                            Text(
                              'Firma acá con tu dedo o lápiz digital',
                              style: TextStyle(
                                fontFamily: 'inter',
                                fontStyle: FontStyle.normal,
                                color: '#9FA7B8'.toColor(),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Container(
                              width: 280,
                              height: 45,
                              child: SfSignaturePad(
                                maximumStrokeWidth: 1.5,
                              )
                            )
                          ],
                        ),
          
                       
          
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: '#E5E5E5'.toColor(),
                        ),
          
                        SizedBox(
                          height: 10,
                        ),
                      
                    ]
                  ),
                ),
          
                SizedBox(
                  height: 10,
                ),
          
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '*Autorizo para que me represente en calidad de voz y voto en las deliberaciones de acuerdo con el orden de temas a tratar en la asamblea.',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      color: '#B1B4C7'.toColor(),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                     
                  ),
                ),
          
                SizedBox(height: 30),
                
                      InkWell(
                        onTap: () => {
                          onSubmit(idUser, fullName.text, numIdentification.text, email.text, assemblyId, context)
                        },
                        child: Container(
                          width: 339,
                          height: 53,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: '#867bfc'.toColor(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        child: Center(
                          child: Text(
                            'Enviar para firma de apoderado',
                            style: TextStyle(
                              color: '#ffffff'.toColor(),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        ),
                      ),
                       SizedBox(height: 100),   
                      
                    ],
                  ),
                ),          
              ],
            ),
          ));

          
    });

    
  }

  onSubmit(String userId, String fullName, String numIdentification, String email, String assemblyId, BuildContext context) {
    Power power = Power(
      giverUserPower: userId, 
      externalUserOwnerPower: ExternalUserOwnerPower(
        fullname: fullName,
        identity: numIdentification,
        email: email
      ), 
      usersRepresenting: [], 
      assembly: assemblyId, 
      isExternal: true
    );

    BlocProvider.of<FormpowerBloc>(context).add(SavePower(context, power));

  }

  Widget _infoUser() {
    return BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
      return Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff7D41DD),
                Color.fromRGBO(134,57,216, 1)
              ],
            )
        ),
        child: Column(
          children: [
            UserInfo(0xffFFFFFF, 0xffFFFFFF, 1),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nº de identificación',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    state.userInfo!.user!.identity.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                  Container(
                    width: 200,
                    child: Text(
                      state.userInfo!.user!.email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nº de teléfono',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    state.userInfo!.user!.phone!.number.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }

  confirmPopup(description, text_button, context) {
    return Container(
      width: 359,
      height: 353,
      
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: SizedBox(
              height: 75,
              width: 75,
              child: ClipRRect(
                  child: Image.asset(
                "assets/icons/start_icon.png",
                isAntiAlias: true,
                fit: BoxFit.fill,
              )),
            ),
          ),

          Text(
            '¡Muy bien!',
            style: TextStyle(
              fontFamily: 'BasicCommercial LT Roman',
              fontStyle: FontStyle.normal,
              color: '#343887'.toColor(),
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(bottom: 26.0),
              child: Text(
                'Tu autorización ha sido aprobada correctamente.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF6C7192),
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0),
              )),
          GradientButton(text_button, () {
            
          }, null)
        ],
      ),
    );
  }

  
}