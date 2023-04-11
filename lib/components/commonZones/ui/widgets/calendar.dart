import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/commonZones/model/common_zone.dart';
import 'package:hipal/components/dashboard/ui/widgets/diseno_not_radius.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/user_info.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../footer/widgets/bottomNavigationBar.dart';
import '../../../footer/widgets/floatingActionBtn.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late List<CommonZone>? items;
  String? selectItem = '';
  String? selectItem2 = '';
  String idCommonZone = '';
  int cost = 0;

  Widget build(BuildContext context) {
    return BlocBuilder<CommonZonesBloc, CommonZonesState>(
        builder: (context, state) {
      return Scaffold(
          extendBody: true,
          appBar: AppBarBackSearch(
            color_buttons: 0xFFF8F8F8,
            color_title: 0xFFF8F8F8,
            name_title: 'Reservar ..',
            color_background: 0xFF6456EB,
            with_search: false,
            view: 'common-zones',
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: const Color(0xff6456EB),
                ))
              : Stack(children: [
                  DisenoNotRadius(181),
                  Row(
                    children: [
                      UserInfo(0xffFFFFFF, 0xffFFFFFF, 1),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 85, right: 34, left: 34),
                            padding: const EdgeInsets.only(left: 80, right: 80),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2)),
                              color: const Color.fromRGBO(
                                  241, 236, 248, 0.03137254901960784),
                              borderRadius: BorderRadius.circular(11),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(119, 115, 158, 0.14),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 80,
                                      child: Text(
                                        state.selectedZone?.name ?? '',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 30,
                                    child: Container(
                                        width: 55.0,
                                        height: 58.0,
                                        decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: state.selectedZone?.image
                                                          ?.url !=
                                                      null
                                                  ? NetworkImage(state
                                                      .selectedZone
                                                      ?.image
                                                      ?.url as String)
                                                  : AssetImage(
                                                          'assets/images/image-default.png')
                                                      as ImageProvider,
                                            ))),
                                  ),
                                ])),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height - 285,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F7FB),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              titleFile(),
                              TableCalendar(
                                locale: 'es',
                                firstDay: DateTime.utc(_focusedDay.year,
                                    _focusedDay.month, _focusedDay.day),
                                lastDay: DateTime.utc(_focusedDay.year + 1,
                                    _focusedDay.month, _focusedDay.day),
                                focusedDay: _focusedDay,
                                calendarFormat: _calendarFormat,
                                calendarStyle: const CalendarStyle(
                                  weekendTextStyle: TextStyle(
                                      color: Color(0xff8378FC), fontSize: 18),
                                  outsideTextStyle: TextStyle(
                                      color: Color(0xff8378FC), fontSize: 18),
                                  disabledTextStyle: TextStyle(
                                      color: Color(0xff9FA7B8), fontSize: 18),
                                  todayTextStyle: TextStyle(
                                      color: Color(0xffFFFFFF), fontSize: 18),
                                  defaultTextStyle: TextStyle(
                                      color: Color(0xff8378FC), fontSize: 18),
                                  todayDecoration: BoxDecoration(
                                    color: Color(0xff8378FC),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                headerStyle: const HeaderStyle(
                                    leftChevronVisible: true,
                                    rightChevronVisible: true,
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    titleTextStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5C5D87),
                                    )),
                                selectedDayPredicate: (day) {
                                  return isSameDay(_selectedDay, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay = focusedDay;
                                    final selected = DateFormat('yyyy-MM-dd')
                                        .format(_selectedDay!);
                                    BlocProvider.of<CommonZonesBloc>(context)
                                        .add(LoadCommonZonesForIDAndDate(
                                            context,
                                            '${state.selectedZone?.id}',
                                            selected));
                                  });
                                },
                                onFormatChanged: (format) {
                                  if (_calendarFormat != format) {
                                    setState(() {
                                      _calendarFormat = format;
                                    });
                                  }
                                },
                                onPageChanged: (focusedDay) {
                                  _focusedDay = focusedDay;
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]));
    });
  }

  Widget titleFile() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: Text(
        'Selecciona el día que deseas reservar',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color(0xff9FA7B8),
            fontSize: 13,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
