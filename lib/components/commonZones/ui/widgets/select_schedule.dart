import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/commonZones/model/zone_model.dart' as Zone;
import 'package:hipal/components/dashboard/ui/widgets/diseno_not_radius.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/user_info.dart';
import 'package:intl/intl.dart';

import '../screens/form_reservation.dart';

class SelectSchedule extends StatefulWidget {
  final cost;
  SelectSchedule(this.cost, {Key? key}) : super(key: key);

  @override
  State<SelectSchedule> createState() => _SelectScheduleState(cost);
}

class _SelectScheduleState extends State<SelectSchedule> {
  final cost;
  _SelectScheduleState(this.cost);
  List<Zone.EnabledHours> items = [];
  List<DropdownMenuItem<String>> menuItemsOrder = [];
  String _formKey = '';
  String _formKeyCheck = '';
  double total = 0.0;
  String selectedValue = "1";
  List<DropdownMenuItem<String>> dropdownItems(List<int> hours) => hours
      .map(
        (hour) => DropdownMenuItem(
            child: Text('${hour} ${hour == 1 ? 'Hora' : 'Horas'}'),
            value: '${hour}'),
      )
      .toList();

  @override
  initState() {
    super.initState();
    final state = BlocProvider.of<CommonZonesBloc>(context).state;
    final length = state.selectedZone?.schedule?[0].availability?.length;
    List<int> allowHours =
        state.selectedZone?.schedule?[0].availableAllowedHours ?? [];
    if (allowHours.length > 0) {
      selectedValue = allowHours[0].toString();
    }
    items = [];
    for (int i = 0; i < length!; i++) {
      if (state.selectedZone?.schedule?[0].availability?[i].allowedHours
              .toString() ==
          selectedValue) {
        items = [
          ...items,
          ...?state.selectedZone?.schedule?[0].availability?[i].enabled_hours
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBarBackSearch(
            color_buttons: 0xFFF8F8F8,
            color_title: 0xFFF8F8F8,
            name_title: 'Horario',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'common-zones'),
        body: Stack(
          children: [
            DisenoNotRadius(140),
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserInfo(0xffFFFFFF, 0xffFFFFFF, 1),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 125),
              decoration: BoxDecoration(
                color: Color(0xffF7F7FB),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          DropdownButtonFormField(
                            style: const TextStyle(
                                color: Color(0xff343887), //<-- SEE HERE
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              label: Text('Selecciona el tiempo de tu reserva',
                                  style: TextStyle(color: Color(0xFFA7A6F5))),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFA7A6F5), width: 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFA7A6F5), width: 2.0),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFA7A6F5), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            dropdownColor: Colors.white,
                            iconEnabledColor: Color(0xFFA7A6F5),
                            iconDisabledColor: Color(0xFFA7A6F5),
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                                final length = state.selectedZone?.schedule?[0]
                                    .availability?.length;
                                items = [];
                                _formKey = '';
                                _formKeyCheck = '';
                                total = 0.0;
                                for (int i = 0; i < length!; i++) {
                                  if (state.selectedZone?.schedule?[0]
                                          .availability?[i].allowedHours
                                          .toString() ==
                                      selectedValue) {
                                    items = [
                                      ...items,
                                      ...?state.selectedZone?.schedule?[0]
                                          .availability?[i].enabled_hours
                                    ];
                                  }
                                }
                              });
                            },
                            items: dropdownItems(state.selectedZone
                                    ?.schedule?[0].availableAllowedHours ??
                                []),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Precio por alquiler',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff9FA7B8),
                                    fontSize: 13,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                state.selectedZone!.isFree ?? true
                                    ? '\$0.00'
                                    : '\$${total}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff8378FC),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: size.width,
                        height: 60,
                        margin: EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F1FE),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  16.0) //                 <--- border radius here
                              ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 30.0,
                              color: Color(0xff8378FC),
                            ),
                            SizedBox(width: 5.0),
                            Expanded(
                                child: RichText(
                              textAlign: TextAlign.left,
                              softWrap: true,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "El número que se encuentra entre paréntisis corresponde",
                                    style: TextStyle(
                                        color: Color(0xff343887),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.8)),
                                TextSpan(
                                    text:
                                        " a la cantidad de cupos disponibles por reserva.",
                                    style: TextStyle(
                                        color: Color(
                                          0xff343887,
                                        ),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.8)),
                              ]),
                            )),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      child: Text(
                        'Horarios disponibles',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff343887),
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2 - 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (c, i) => _scheduleCard(i),
                        itemCount: items.length,
                      ),
                    ),
                    _btnNextFile()
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _scheduleCard(int i) {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        var end = items[i].end != null ? items[i].end.toString() : '';
        var star =
            items[i].start.toString() != '' ? items[i].start.toString() : '';
        var availability = items[i].available_reserves.toString() != ''
            ? items[i].available_reserves.toString()
            : '';
        DateFormat dateFormat = DateFormat('HH:mm');
        DateTime dateFormatEnd = dateFormat.parse(end);
        String hourEnd = DateFormat.jm().format(dateFormatEnd);
        DateTime dateFormatStar = dateFormat.parse(star);
        String hourStar = DateFormat.jm().format(dateFormatStar);
        return Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  color: Color(0xffF2F1FE),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffF2F1FE)),
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        items[i].end != null
                            ? ' $hourStar | $hourEnd ($availability)'
                            : '',
                        style: TextStyle(
                            color: Color(0xff8378FC),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        _formKey = i.toString();
                      })
                    },
                  ),
                ),
              ),
              i.toString() != _formKeyCheck
                  ? Visibility(
                      visible: i.toString() == _formKey ? true : false,
                      child: Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            gradient: const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment(0, 1.0),
                              colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (state.selectedZone!.isFree ?? true) {
                                  total = 0;
                                } else {
                                  total = cost * int.parse(selectedValue);
                                }

                                _formKeyCheck = i.toString();
                                BlocProvider.of<CommonZonesBloc>(context).add(
                                    ChangeHour(items[i].start, items[i].end));
                                BlocProvider.of<CommonZonesBloc>(context)
                                    .add(ChangeCost(total.toString()));
                              });
                            },
                            child: Text('Confirmar',
                                style: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      ),
                    )
                  : Visibility(
                      visible: i.toString() == _formKey ? true : false,
                      child: Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Color(0xffDCFDF2)),
                          child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                                'assets/images/checkSchedule.png',
                                color: Color(0xff4DA979)),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _btnNextFile() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: MaterialButton(
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
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: Text(
            'Siguiente',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff7B6FFA).withOpacity(0.34),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
        ),
        onPressed: () {
          if (_formKeyCheck != '')
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormReservation()));
        },
      ),
    );
  }
}
