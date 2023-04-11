import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/lostObjects/bloc/lost_object_bloc.dart';
import 'package:hipal/components/lostObjects/model/lost_object.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/white_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InformationLostObject extends StatelessWidget {
  LostObject lostObject;

  InformationLostObject({required this.lostObject});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 24.0,
          ),
          child: Text(
            lostObject.nameObject.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Color(0xFF897EFD)),
          ),
        ),
        _state_info(),
        BorderLine(1, 28, 28, 0xFFDFDDFD),
        Container(
          margin: EdgeInsets.only(top: 22.0),
          child: _subTitle("Información de producto"),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 22.0),
          child: Column(
            children: [
              _infoTitle("Marca:", lostObject.mark.toString()),
              _infoTitle("Color:", lostObject.color.toString()),
              _infoTitle("Descripción:", lostObject.description.toString()),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 22.0),
          child: _subTitle("Información de reporte"),
        ),
        _infoReport(),
        lostObject.state.toString() != "Entregado"
            ? Container(
                margin: EdgeInsets.only(top: 60.0, bottom: 50),
                child: _button(context),
              )
            : Container()
      ],
    );
  }

  Widget _state_info() {
    return BlocBuilder<LostObjectBloc, LostObjectState>(
        builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Estado:",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF343887)),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 18.0),
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: lostObject.state.toString() == "Entregado"
                          ? Color(0xFFDCFDF2)
                          : Color(0xFFFFEDE3)),
                  child: lostObject.state.toString() == "Entregado"
                      ? Icon(const IconData(0xe92c, fontFamily: 'icomoon'),
                          size: 12, color: Color(0xFF4DA979))
                      : Icon(const IconData(0xe92c, fontFamily: 'icomoon'),
                          size: 12, color: Color(0xFFFE9D6D)),
                ),
                Text(
                  lostObject.state.toString(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF343887)),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _subTitle(String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF343887)),
    );
  }

  Widget _infoTitle(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6C7192)),
            )),
        Expanded(
            flex: 4,
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6C7192)),
            ))
      ],
    );
  }

  Widget _infoReport() {
    return Container(
      margin: EdgeInsets.only(
        top: 11.0,
      ),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(19, 119, 115, 158),
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
    );
  }

  Widget _button(context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(123, 111, 250, 0.34),
                blurRadius: 9,
                offset: Offset(0, 5)),
          ]),
      child: TextButton.icon(
          style: TextButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent),
          icon: Icon(
            const IconData(0xe92b, fontFamily: 'icomoon'),
            color: Color(0xFFFFFFFF),
            size: 19,
          ),
          label: Text(
            "Reclamar",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.0),
          ),
          onPressed: () {
            _onAlertWithCustomContentPressed(context);
          }),
    );
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
            context: context,
            content: _contentPopup(context),
            style: AlertStyle(isButtonVisible: false, isCloseButton: false))
        .show();
  }

  Widget _contentPopup(context) {
    return Column(
      children: [
        lostObject.images?.length != 0
            ? Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 13.0, bottom: 23.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: SizedBox(
                  child: ClipRRect(
                    child: (lostObject.images == null ||
                            lostObject.images?.length == 0)
                        ? Container(
                            width: 250.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff6456EB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.0)),
                            ),
                          )
                        : Container(
                            width: 250.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff6456EB),
                              image: DecorationImage(
                                image: NetworkImage(
                                    lostObject.images![0].url.toString()),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.0)),
                            ),
                          ),
                  ),
                ),
              )
            : Container(
                alignment: Alignment.center,
                height: 250,
                child: Text(
                  "Este objeto no contiene fotos",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6C7192)),
                ),
              ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Por favor confirme que este objeto perdido es suyo",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6C7192)),
          ),
        ),
        GradientButton("Confirmar", () {
          BlocProvider.of<LostObjectBloc>(context).add(
              EditLostObject(context, lostObject.id.toString(), "Entregado"));
          Navigator.of(context, rootNavigator: true).pop();
          Alert(
                  context: context,
                  content: _confirmPopup(
                      "Ha sido confirmada exitosamente, para finalizar la entrega debes recogerla en la porteria del edificio. ¡Gracias!",
                      "Entendido",
                      context),
                  style:
                      AlertStyle(isButtonVisible: false, isCloseButton: false))
              .show();
        }, EdgeInsets.only(bottom: 10)),
        WhiteButton("Cancelar", () {
          Navigator.of(context, rootNavigator: true).pop();
        }, true, 0xFF7E72FF, EdgeInsets.only(bottom: 14.0)),
      ],
    );
  }

  _confirmPopup(description, text_button, context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 95.0,
            width: 117.0,
            child: ClipRRect(
                child: Image.asset(
              "assets/images/ok_check.png",
              isAntiAlias: true,
              fit: BoxFit.fill,
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton(text_button,
            () => {Navigator.of(context, rootNavigator: true).pop()}, null)
      ],
    );
  }
}
