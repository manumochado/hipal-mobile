import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/formpower_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/powers_bloc.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/assembly/model/powerAssembly.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/utils/extension_color.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/user_info.dart';

import 'package:hipal/widgets/widgets.dart';

class AnnouncementAssembly extends StatefulWidget {
  @override
  _AnnouncementAssembly createState() => _AnnouncementAssembly();
}

class _AnnouncementAssembly extends State<AnnouncementAssembly> {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormpowerBloc, FormpowerState>(
        builder: (context, state) {
      return Scaffold(
          // controller: _refreshController,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: '#7d41dd'.toColor(),
                        ),
                      ),

                      Container(
                        height: 50,
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 15),
                        Text(
                          'Convocatoria',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: '#7d41dd'.toColor(),
                          ),
                        ),

                        Text(
                          'extraordinaria Asamblea',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: '#7d41dd'.toColor(),
                          ),
                        ),

                        SizedBox(height: 26),

                        Text(
                          'Tal como lo establecen las disposiciones de nuestro Estatuto Social, se CONVOCA A ASAMBLEA DE PROPIETARIOS para el día 28 de marzo de 2022, a las 10:00 am, en esta ciudad de Bogotá - Colombia. ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: '#6C7192'.toColor(),
                          ),
                        ),

                        SizedBox(height: 38),

                        Text(
                          'Orden del día',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: '#343887'.toColor(),
                          ),
                        ),

                        SizedBox(height: 25),

                        Text(
                          'En el siguiente documento adjunto encontrarás toda la información sobre el orden del día y los puntos a tratar durante nuestra Asamblea.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: '#6C7192'.toColor(),
                          ),
                        ),

                        SizedBox(height: 33),

                        Container(
                          width: 374,
                          height: 76,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: '#F2F0FA'.toColor(),
                            borderRadius: BorderRadius.circular(14),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: '#E3DFF8'.toColor(),
                                        borderRadius: BorderRadius.circular(50),
                                      ),

                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/pdf.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                    
                                        Text(
                                          'Acta de',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: '#343887'.toColor(),
                                          ),
                                        ),
                                        Text(
                                          'convocatoria',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: '#343887'.toColor(),
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          '2022/02/18',
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w400,
                                            color: '#9FA7B8'.toColor(),
                                          ),
                                        ),
                                        
                                      ]
                                    ),
                                    
                                  ]
                                ),
                              ),

                              Image.asset(
                                'assets/images/download.png',
                                width: 26,
                                height: 26,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )));
    });
  }

  
}
