import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/widgets/input_decorations.dart';
import '../../../bloc/user_bloc.dart';

class TitlePropertyInformation extends StatelessWidget {
  final type_residential = {
    "UserLiving": "Residente",
    "UserOwner": "Propietario"
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        _titlePropertyInformation(),
        _nameEdificeField(),
        _addressField(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            children: [
              Expanded(flex: 2, child: SizedBox(width: size.width * 0.45, child: _residentTypeField())),
              Expanded(flex: 1, child: SizedBox(width: size.width * 0.45, child: _towerField())),
              Expanded(flex: 1, child: SizedBox(width: size.width * 0.45, child: _numberField(context))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _titlePropertyInformation() {
    return Container(
      margin: EdgeInsets.only(left: 28.0),
      child: ListTile(
        leading: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 111, 250, 0.55),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            const IconData(
              0xe925,
              fontFamily: 'icomoon',
            ),
            color: Colors.white,
            size: 22.0,
          ),
        ),
        title: const Text(
          'Información del inmueble',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _nameEdificeField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          margin: EdgeInsets.only(left: 28, right: 25),
          child: Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              initialValue:
                  state.userInfo?.apartment?.tower?.residential?.name != null
                      ? state.userInfo?.apartment?.tower?.residential?.name
                      : "",
              enabled: false,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Nombre del Edificio',
                sizeLabel: 13.0,
                borderColor: Color(0xFFDFDDFD),
                //suffixIcon: (state.family!.name!=null && state.family!.name!='') ? Icon(const IconData(0xe91e, fontFamily: 'icomoon'), color: Color(0xff4DA979),) : null
              ),
            ),
          ));
    });
  }

  Widget _addressField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          margin: EdgeInsets.only(left: 28, right: 25),
          child: Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              initialValue:
                  state.userInfo?.apartment?.tower?.residential?.address != null
                      ? state.userInfo?.apartment?.tower?.residential?.address
                      : "",
              enabled: false,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Dirección',
                sizeLabel: 13.0,
                borderColor: Color(0xFFDFDDFD),
                //suffixIcon: (state.family!.name!=null && state.family!.name!='') ? Icon(const IconData(0xe91e, fontFamily: 'icomoon'), color: Color(0xff4DA979),) : null
              ),
            ),
          ));
    });
  }

  Widget _residentTypeField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: state.userInfo?.userName!.name != null
              ? type_residential[state.userInfo?.userName!.name]
              : "",
          enabled: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold, fontSize: 13),
          decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Tipo de residente',
            sizeLabel: 13.0,
            borderColor: Color(0xFFDFDDFD),
            //suffixIcon: (state.family!.name!=null && state.family!.name!='') ? Icon(const IconData(0xe91e, fontFamily: 'icomoon'), color: Color(0xff4DA979),) : null
          ),
        ),
      ));
    });
  }

  Widget _towerField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 13, left: 20),
        child: TextFormField(
          initialValue: state.userInfo?.apartment?.tower != null
              ? state.userInfo!.apartment!.tower!.name
              : '',
          enabled: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold, fontSize: 10),
          decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Torre',
            sizeLabel: 13.0,
            borderColor: Color(0xFFDFDDFD),
            //suffixIcon: (state.family!.name!=null && state.family!.name!='') ? Icon(const IconData(0xe91e, fontFamily: 'icomoon'), color: Color(0xff4DA979),) : null
          ),
        ),
      ));
    });
  }

  Widget _numberField(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              initialValue: state.userInfo?.apartment != null
                  ? state.userInfo!.apartment!.name
                  : '',
              enabled: false,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Color(0xff5C5D87), fontWeight: FontWeight.bold, fontSize: 13),
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Nº Apto',
                sizeLabel: 13.0,
                borderColor: Color(0xFFDFDDFD),
                //suffixIcon: (state.family!.name!=null && state.family!.name!='') ? Icon(const IconData(0xe91e, fontFamily: 'icomoon'), color: Color(0xff4DA979),) : null
              ),
            ),
          ));
    });
  }
}
