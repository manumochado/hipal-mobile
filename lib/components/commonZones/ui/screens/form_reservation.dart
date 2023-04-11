import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/friends/model/friends.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/card_image.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../utils/general.dart';
import '../../../friends/ui/screens/friend_screen.dart';

class FormReservation extends StatefulWidget {
  @override
  createState() => _FormReservation();
}

class _FormReservation extends State<FormReservation> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  List<Friends> _friendsList = [];
  bool fieldEditable = false;
  late BuildContext global;

  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CommonZonesState state = BlocProvider.of<CommonZonesBloc>(context).state;
    if (state.isEditing) {
      fieldEditable = state.isEditing;
      final start = DateTimeHelper.hm(state.reservation?.start as DateTime);
      final end = DateTimeHelper.hm(state.reservation?.end as DateTime);
      final initialDay =
          DateTimeHelper.yyyyMMdd(state.reservation?.start as DateTime);
      BlocProvider.of<CommonZonesBloc>(context).add(ChangeHour(start, end));
      BlocProvider.of<CommonZonesBloc>(context)
          .add(ChangeSelectedDate(initialDay));
      BlocProvider.of<CommonZonesBloc>(context)
          .add(ChangeCost(state.reservation?.amount.toString() as String));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    global = context;
    return Scaffold(
        appBar: AppBarBackSearch(
          color_buttons: 0xFFFFFFFF,
          color_title: 0xFFFFFFFF,
          name_title: 'Horario',
          color_background: 0xFF6456EB,
          with_search: false,
          view: 'my-reservations',
        ),
        body: Stack(
          children: [
            _infoHead(),
            _widgetBody(),
          ],
        ));
  }

  Widget _infoHead() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          begin: Alignment.center,
          end: Alignment(0, 1.5),
          colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
        ),
      ),
      child: Center(
          child: Column(
        children: [
          CardImage(
            colorTitle: 0xFFFFFFFF,
            colorDescription: 0xFFFFFFFF,
            isHome: false,
          )
        ],
      )),
    );
  }

  Widget _widgetBody() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      _friendsList = (state.listFriends != null ? state.listFriends : [])!;
      return Container(
          margin: EdgeInsets.only(top: 110),
          padding: EdgeInsets.only(top: 27, left: 20, right: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 230,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: const Color(0xff6456EB),
                ))
              : SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          _typeZone(),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                _titleForm("Confirmación de tu reserva"),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: _dateField(),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: _hourField(),
                                    )
                                  ],
                                ),
                                _titleForm("Cuenta de cobro"),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: _priceField(),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: _countField(),
                                    )
                                  ],
                                ),
                                _friends(),
                              ],
                            ),
                          ),
                          /*state.isEditing ?
                      Container(
                          margin: const EdgeInsets.only(
                              left: 38, top: 40, right: 38),
                          child: _buttonEditReservation()) : Container(),*/
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 38, top: 40, right: 38, bottom: 50),
                              child: _buttonSaveReservation()),
                          /*Container(
                        margin: const EdgeInsets.only(top: 36),
                        child: _buttonCancel(),
                      )*/
                        ],
                      ))));
    });
  }

  _titleForm(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30),
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xff343887),
            fontSize: 13,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _dateField() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 10),
        child: TextFormField(
          enabled: fieldEditable,
          onChanged: (value) {
            BlocProvider.of<CommonZonesBloc>(context)
                .add(ChangeSelectedDate(value));
          },
          initialValue: state.isEditing
              ? DateTimeHelper.yyyyMMdd(state.reservation?.start as DateTime)
              : state.selectedDate,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Fecha',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: Icon(
                const IconData(0xe91e, fontFamily: 'icomoon'),
                color: Color(0xff4DA979),
              )),
          validator: (value) {
            if (value == '' ||
                !RegExp(r'^\d{4}(-)(((0)[0-9])|((1)[0-2]))(-)([0-2][0-9]|(3)[0-1])$')
                    .hasMatch(value!)) {
              return "";
            } else {
              return null;
            }
          },
        ),
      ));
    });
  }

  Widget _hourField() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      String start = '';
      String end = '';
      if (state.isEditing) {
        start = DateFormat.Hm().format(state.reservation?.start as DateTime);
        end = DateFormat.Hm().format(state.reservation?.end as DateTime);
      }
      ;
      String hourReservation =
          state.isEditing ? start + '-' + end : state.start + "-" + state.end;
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 10),
        child: TextFormField(
          enabled: fieldEditable,
          onChanged: (value) {
            List<String> list = value.split("-");
            final start = list.length > 0 ? list[0] : '00:00';
            final end = list.length > 1 ? list[1] : '00:00';
            BlocProvider.of<CommonZonesBloc>(context)
                .add(ChangeHour(start, end));
          },
          initialValue: hourReservation,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Hora',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: Icon(
                const IconData(0xe91e, fontFamily: 'icomoon'),
                color: Color(0xff4DA979),
              )),
          validator: (value) {
            if (value == '' ||
                !RegExp(r'^([0-9]{2}):([0-9]{2})-([0-9]{2}):([0-9]{2})$')
                    .hasMatch(value!)) {
              return "";
            } else {
              return null;
            }
          },
        ),
      ));
    });
  }

  Widget _priceField() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 10),
        child: TextFormField(
          enabled: false,
          initialValue: state.isEditing
              ? state.reservation?.amount.toString()
              : state.cost,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Precio',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: Icon(
                const IconData(0xe91e, fontFamily: 'icomoon'),
                color: Color(0xff4DA979),
              )),
          /*onChanged: (value) =>
                  context.read<FormpetBloc>().add(ChangeName(value)),*/
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _countField() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Container(
          child: Padding(
              padding: EdgeInsets.only(right: 20, left: 10, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Cargar a la cuenta",
                      style: TextStyle(
                          color: Color(0xff9FA7B8),
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: fieldEditable
                        ? (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          }
                        : null,
                    activeTrackColor: Color(0xFFF2F1FE),
                    activeColor: Color(0xFF7E72FF),
                  ),
                ],
              )));
    });
  }

  Widget _friends() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "¿Quieres invitar un amig@?",
                style: TextStyle(
                    color: Color(0xff343887),
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ),
            FriendScreen(), //Load User invite
          ],
        ),
        _listView(),
      ],
    );
  }

  Widget _typeZone() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F1FE),
          borderRadius: BorderRadius.circular(11),
        ),
        child: ListTile(
            leading: Container(
                width: 54.0,
                height: 54.0,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
                child: state.isEditing
                    ? Container(
                        width: 55.0,
                        height: 58.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  state.reservation?.commonZone?.image?.url !=
                                          null
                                      ? NetworkImage(state.reservation
                                          ?.commonZone?.image?.url as String)
                                      : AssetImage(
                                              'assets/images/image-default.png')
                                          as ImageProvider,
                            )))
                    : Container(
                        width: 55.0,
                        height: 58.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: state.selectedZone?.image?.url != null
                                  ? NetworkImage(
                                      state.selectedZone?.image?.url as String)
                                  : AssetImage(
                                          'assets/images/image-default.png')
                                      as ImageProvider,
                            )))),
            title: Text(
              state.isEditing
                  ? state.reservation?.commonZone?.name ?? ''
                  : state.selectedZone?.name ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0,
                  color: Color(0xff343887)),
            ),
            onTap: () => {},
            trailing: IconButton(
              icon: Icon(const IconData(0xe91e, fontFamily: 'icomoon'),
                  size: 30, color: Color(0xff4DA979)),
              onPressed: () {},
            )),
      );
    });
  }

  Widget _listView() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _friendsList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: _cardFriend(index),
        );
      },
    );
  }

  _cardFriend(int i) {
    String name_full = "";
    if (_friendsList[i].name != null) {
      name_full = _friendsList[i].name.toString();
    }
    if (_friendsList[i].lastName != null) {
      name_full += " " + _friendsList[i].lastName.toString();
    }
    return ListTile(
        title: Text(
          name_full,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          _friendsList[i].identity.toString(),
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
        ),
        onTap: () {},
        trailing: Container(
          child: ElevatedButton(
            child: Icon(const IconData(0xe917, fontFamily: 'icomoon'),
                size: 18, color: Color(0xFFF9FAFE)),
            onPressed: () {
              BlocProvider.of<CommonZonesBloc>(context)
                  .add(DeleteGuestReservation(_friendsList[i].id.toString()));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 0),
              fixedSize: const Size(4, 4),
              shape: const CircleBorder(),
              primary: const Color(0xFF714CF6),
            ),
          ),
        ));
  }

  _onSubmit(CommonZonesState state, BuildContext context) async {
    FocusScope.of(context).unfocus();

    // Validate Form
    if (!_formKey.currentState!.validate() && state.isEditing) return;

    final reservationService = BlocProvider.of<CommonZonesBloc>(context);
    reservationService.add(ChangeLoading(true));
    List<String> idGuest = [];
    if (state.guest != null && state.guest!.isNotEmpty) {
      for (int i = 0; i < state.guest!.length; i++) {
        idGuest.add(state.guest![i].id as String);
      }
    }
    int startParse = 0;
    int endParse = 0;
    startParse = int.parse(state.start.split(':')[0]);
    endParse = int.parse(state.end.split(':')[0]);
    int calculateCost = endParse - startParse;
    double costZone = state.reservation?.commonZone?.costPerHour ?? 0.0;
    final params = {
      "common_zone": state.isEditing
          ? state.reservation?.commonZone?.id
          : state.selectedZone?.id,
      //"date": DateFormat('yyyy-MM-dd').format(state.reservation!.date!),
      "start": state.selectedDate + 'T' + state.start,
      "end": state.selectedDate + 'T' + state.end,
      "amount": state.isEditing
          ? (calculateCost * costZone).toStringAsFixed(2)
          : state.cost,
      "guests": idGuest.isNotEmpty ? idGuest : [],
    };
    print('PARAMETERS');
    print(params);
    final dynamic response;
    if (!state.isEditing) {
      response = await reservationService.commonZonesRepo
          .saveReservation(context, params);
    } else {
      response = await reservationService.commonZonesRepo
          .editReservation(context, state.reservation!.id.toString(), params);
    }

    reservationService.add(ChangeLoading(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final msg = state.isEditing
          ? "¡Has editado la reservación con éxito, disfruta de las instalaciones de tu edificio!"
          : "¡Has reservado con éxito, disfruta de las instalaciones de tu edificio!";
      Alert(
          context: global,
          content: reservationService.confirmPopup(global,
              errorName: msg, goTo: "my-reservations"),
          style: AlertStyle(
            isButtonVisible: false,
            isCloseButton: false,
            overlayColor: Color.fromRGBO(52, 56, 135, 0.74),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(
                width: 3.0,
                color: Color(0xFF776BF8),
              ),
            ),
          )).show();
    }
    if (response != null && response.statusCode == 400) {
      final start = DateTimeHelper.hm(state.reservation?.start as DateTime);
      final end = DateTimeHelper.hm(state.reservation?.end as DateTime);
      reservationService.add(ChangeHour(start, end));
      final resp = json.decode(response.body);
      Alert(
          context: global,
          content: reservationService.confirmPopup(global,
              errorName: resp['message'], isInfo: true),
          style: AlertStyle(
            isButtonVisible: false,
            isCloseButton: false,
            overlayColor: Color.fromRGBO(52, 56, 135, 0.74),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(
                width: 3.0,
                color: Color(0xFF776BF8),
              ),
            ),
          )).show();
    }
  }

  Widget _buttonSaveReservation() {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return MaterialButton(
          color: Color(0xFF776BF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Color(0xff7E72FF),
            ),
          ),
          elevation: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 55, vertical: 18),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                state.isLoading
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        state.isEditing ? 'Editar' : 'Confirmar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ]),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff7B6FFA).withOpacity(0.34),
                    spreadRadius: 0,
                    blurRadius: 9,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              )),
          onPressed: () async {
            state.isLoading ? null : _onSubmit(state, context);
          });
    });
  }
}
