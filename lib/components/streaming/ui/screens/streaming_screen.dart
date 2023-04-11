import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/streaming/bloc/streamings_bloc.dart';
import 'package:hipal/components/streaming/model/streaming.dart';
import 'package:hipal/components/streaming/ui/widgets/streaming_datails.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:hipal/widgets/user_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

class StreamingsScreen extends StatefulWidget {
  @override
  _StreamingsScreen createState() => _StreamingsScreen();
}

class _StreamingsScreen extends State<StreamingsScreen> {
  @override
  void initState() {
    BlocProvider.of<StreamingBloc>(context).add(LoadStreamings(context));
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Streaming> items = [];
  bool loadFinished = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child:
        BlocBuilder<StreamingBloc, StreamingsState>(builder: (context, state) {
      items = (state.streamings != null ? state.streamings : [])!;
      print(items.length);
      Timer(const Duration(seconds: 10), () {
        try {
          setState(() {
            loadFinished = true;
          });
        } catch (e) {}
      });
      return Scaffold(
        extendBody: true,
        appBar: AppBarBackSearch(
          color_buttons: 0xFFFFFFFF,
          color_title: 0xFFFFFFFF,
          name_title: 'Streaming',
          color_background: 0xFF6456EB,
          with_search: false,
          view: 'dashboard',
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment(0, 2.0),
                    colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                  ),
                ),
                height: 130,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: UserInfo(0xffFFFFFF, 0xffFFFFFF, 1)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reuniones',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDBCCF6),
                              fontSize: 9),
                        ),
                        Container(
                          width: 41,
                          height: 23,
                          decoration: BoxDecoration(
                            color: Color(0xffFE9D6D),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              items.length.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                  fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFF9FAFE),
                ),
                child: items.length == 0
                    ? Container(
                        margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,
                        height: 90,
                        child: !loadFinished
                            ? CircularProgressIndicator(
                                color: const Color(0xff6456EB),
                              )
                            : Text("No hay información para mostrar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff6456EB),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400)),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          controller: _refreshController,
                          onRefresh: () async {
                            BlocProvider.of<StreamingBloc>(context)
                                .add(LoadStreamings(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            _refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            BlocProvider.of<StreamingBloc>(context)
                                .add(LoadStreamings(context));
                            await Future.delayed(Duration(milliseconds: 1000));
                            _refreshController.loadComplete();
                          },
                          child: items.length > 0
                              ? ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (c, i) => _streamingsCard(i),
                                  itemCount: items.length,
                                  // ],
                                )
                              : Container(),
                        ),
                      ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }

  Widget _streamingsCard(int i) {
    return BlocBuilder<StreamingBloc, StreamingsState>(
        builder: (context, state) {
      List<String> arrMonth = [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ];
      List<String> days = [
        'Lunes',
        'Martes',
        'Miercoles',
        'Jueves',
        'Viernes',
        'Sabado',
        'Domingo'
      ];
      DateFormat dateFormat = DateFormat('HH:mm');
      DateTime dateTime = dateFormat.parse(items[i].time.toString());
      if (i <= items.length - 1) {
        return Card(
          child: ListTile(
            leading: Container(
              width: 54.0,
              height: 54.0,
              decoration: BoxDecoration(
                color: const Color(0xffEFEEFE),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
              child: Image.asset('assets/images/iconStreaming.png'),
            ),
            title: Text(
              items[i].topic != null ? items[i].topic.toString() : '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 11, color: Color(0xff8378FC)),
                SizedBox(width: 2),
                Flexible(
                    child: Text(
                  '${items[i].date!.day} ${arrMonth[items[i].date!.month - 1]}, ${days[items[i].date!.weekday - 1]} - ${DateFormat.jm().format(dateTime)}',
                  style:
                      const TextStyle(color: Color(0xff8378FC), fontSize: 11.0),
                )),
              ],
            ),
            onTap: () => {},
            trailing: Container(
              width: 70,
              height: 30,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xff7E72FF))),
              child: TextButton(
                onPressed: () {
                  String idStreaming = items[i].id.toString();
                  String topic = items[i].topic.toString();
                  DateTime? fecha = items[i].date;
                  String date = DateFormat('yyyy-MM-dd').format(fecha!);
                  String hour = items[i].hour.toString();
                  String minutes = items[i].minutes.toString();
                  String link = items[i].link.toString();
                  String lastname = items[i].users.lastname.toString();
                  String firstname = items[i].users.firstname.toString();
                  String description = items[i].description.toString();
                  String? url = items[i].users.photo?.url;
                  String time = items[i].time.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StreamingDetails(
                            idStreaming,
                            topic,
                            date,
                            hour,
                            link,
                            lastname,
                            firstname,
                            description,
                            time,
                            minutes,
                            url!)),
                  );
                },
                child: Text('Ingresar',
                    style: const TextStyle(
                      color: Color(0xff8378FC),
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
