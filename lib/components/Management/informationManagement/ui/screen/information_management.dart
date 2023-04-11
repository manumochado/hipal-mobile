import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/informationManagement/bloc/management_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:intl/intl.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationManagement extends StatefulWidget {
  InformationManagement({Key? key}) : super(key: key);

  @override
  State<InformationManagement> createState() => _InformationManagementState();
}

class _InformationManagementState extends State<InformationManagement> {

  bool loadFinished = false;

  @override
  void initState() {
    BlocProvider.of<ManagementBloc>(context).add(LoadManagement(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try{
      Timer(const Duration(seconds: 5), (){
        setState(() {
          loadFinished = true;
        });
      });
    }catch(e){}
    return WillPopScope(
        onWillPop: () async{
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: BlocBuilder<ManagementBloc, ManagementState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBarBackSearch(
                color_buttons: 0xFFFFFFFF,
                color_title: 0xFFFFFFFF,
                name_title: 'Conoce a tu administrador',
                color_background: 0xFF6456EB,
                with_search: false,
                view: 'dashboard',
              ),
              body: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 240,
                          padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment(0, 2.0),
                              colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                            ),
                          ),
                          child: _dataAdmin()),
                      Container(
                          height: 150,
                          margin: EdgeInsets.only(top: 225),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Color(0xffEFF3FE)),
                          child: _dataCompany()),
                      Container(
                        margin: EdgeInsets.only(top: 375, bottom: 70),
                        padding: EdgeInsets.only(left: 30, right: 30),
                        color: Color(0xffFFFFFF),
                        width: double.infinity,
                        child: state.managements != null ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Perfil profesional',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff343887),
                                  fontSize: 13),
                            ),
                            SizedBox(height: 20),
                            Text(
                              state.managements != null
                                  ? state.managements!.profile.toString()
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff6C7192),
                                  fontSize: 15),
                            ),
                            SizedBox(height: 20),
                            state.managements?.documents != null ?
                            Center(
                              child: MaterialButton(
                                onPressed: () => {
                                  launch(state.managements != null
                                      ? state.managements!.documents![0].url
                                      .toString()
                                      : '')
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(
                                    color: Color(0xff7E72FF),
                                  ),
                                ),
                                disabledColor: Colors.grey,
                                elevation: 0,
                                color: Color(0xFF776BF8),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 50, right: 50, top: 20, bottom: 20),
                                  child: Text(
                                    'Ver Hoja de Vida',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff7B6FFA)
                                            .withOpacity(0.34),
                                        spreadRadius: 0,
                                        blurRadius: 9,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ) : Container(),
                          ],
                        ) : Container(),
                      )
                    ],
                  )
                ],
              ),
              extendBody: true,
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionBtn(),
              bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
            );
          },
        )
    );
  }

  Widget _dataCompany() {
    return BlocBuilder<ManagementBloc, ManagementState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xffFFFFFF)),
                      child: Image.asset('assets/images/matricula.png')),
                  SizedBox(height: 20),
                  Text(
                    'No.  Matricula',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5C5D87),
                        fontSize: 10),
                  ),
                  SizedBox(height: 10),
                  Text(
                    state.managements != null
                        ? state.managements!.registrationProfession.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8378FC),
                        fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xffFFFFFF)),
                      child: Image.asset('assets/images/rut.png')),
                  SizedBox(height: 20),
                  Text(
                    'RUT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5C5D87),
                        fontSize: 10),
                  ),
                  SizedBox(height: 10),
                  Text(
                    state.managements != null
                        ? state.managements!.rut.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8378FC),
                        fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xffFFFFFF)),
                      child: Image.asset('assets/images/vigencia.png')),
                  SizedBox(height: 20),
                  Text(
                    'Vigencia',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5C5D87),
                        fontSize: 10),
                  ),
                  SizedBox(height: 10),
                  Text(
                    state.managements != null
                        ? DateFormat('yyyy-MM-dd')
                        .format(state.managements!.termCharge as DateTime)
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8378FC),
                        fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xffFFFFFF)),
                      child: Image.asset('assets/images/empresa.png')),
                  SizedBox(height: 20),
                  Text(
                    'Empresa',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5C5D87),
                        fontSize: 10),
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      state.managements != null
                          ? state.managements!.nameBussiness.toString()
                          : '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8378FC),
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget _dataAdmin() {
    return BlocBuilder<ManagementBloc, ManagementState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  ),
                  child: _infoUser()),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fecha de nacimiento:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffDBCCF6),
                        fontSize: 13),
                  ),
                  Text(
                    state.managements != null
                        ? DateFormat('yyyy-MM-dd')
                        .format(state.managements!.dateBirth as DateTime)
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                        fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Teléfono:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffDBCCF6),
                        fontSize: 13),
                  ),
                  Text(
                    state.managements != null
                        ? state.managements!.phone.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                        fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffDBCCF6),
                        fontSize: 13),
                  ),
                  Text(
                    state.managements != null
                        ? state.managements!.email.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                        fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profesión:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffDBCCF6),
                        fontSize: 13),
                  ),
                  Text(
                    state.managements != null
                        ? state.managements!.profession.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                        fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Permiso de la alcaldía:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffDBCCF6),
                        fontSize: 13),
                  ),
                  Text(
                    state.managements != null
                        ? state.managements!.mayoralPermit.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                        fontSize: 13),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget _infoUser() {
    return BlocBuilder<ManagementBloc, ManagementState>(
      builder: (context, state) {
        return Container(
          child: state.managements != null
              ? ListTile(
            leading: Container(
                width: 55.0,
                height: 55.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: state.managements!.image?.url != ""
                          ? NetworkImage(
                          state.managements!.image!.url.toString())
                          : AssetImage('assets/images/image-default.png')
                      as ImageProvider,
                    ))),
            title: Text(
              state.managements != null
                  ? '${state.managements!.names} ${state.managements!.lastNames}'
                  .toString()
                  : '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF),
                  fontSize: 13),
            ),
            subtitle: Text(
              state.managements != null
                  ? 'Administrador ${state.managements!.residential?.name}'
                  .toString()
                  : '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF),
                  fontSize: 13),
            ),
          )
              : Text(
            !loadFinished ? 'Cargando informacion...' : "No hay información del administrador para mostar",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffFFFFFF),
                fontSize: 13),
          ),
        );
      },
    );
  }
}
