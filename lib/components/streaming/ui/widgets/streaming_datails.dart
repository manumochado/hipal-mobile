// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class StreamingDetails extends StatefulWidget {
  String idStreaming,
      topic,
      date,
      hour,
      link,
      lastname,
      firstname,
      description,
      time,
      minutes,
      url;
  StreamingDetails(
      this.idStreaming,
      this.topic,
      this.date,
      this.hour,
      this.link,
      this.lastname,
      this.firstname,
      this.description,
      this.time,
      this.minutes,
      this.url,
      {Key? key})
      : super(key: key);

  @override
  State<StreamingDetails> createState() => _StreamingDetailsState(
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
      url);
}

class _StreamingDetailsState extends State<StreamingDetails> {
  String idStreaming,
      topic,
      date,
      hour,
      link,
      lastname,
      firstname,
      description,
      time,
      minutes,
      url;
  _StreamingDetailsState(
      this.idStreaming,
      this.topic,
      this.date,
      this.hour,
      this.link,
      this.lastname,
      this.firstname,
      this.description,
      this.time,
      this.minutes,
      this.url);
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('HH:mm');
    DateTime dateTime = dateFormat.parse(time);
    DateTime hourSum = dateTime
        .add(new Duration(hours: int.parse(hour), minutes: int.parse(minutes)));
    print("hora sumada: $hourSum");
    DateTime dateMod = DateFormat('yyyy-MM-dd').parse(date);
    List<String> days = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo'
    ];
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
    print('link: $link');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset("assets/images/detailsStreaming.png",
                fit: BoxFit.fill),
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: IconButton(
                color: Color(0xffFFFFFF),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, 'streaming'),
                icon: Icon(Icons.arrow_back, size: 25)),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                        topic.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                            fontSize: 23)
                    )
                ),
                Container(
                  height: 32,
                  width: 86,
                  decoration: BoxDecoration(
                    color: Color(0xff8378FC),
                  ),
                  child: TextButton(
                    onPressed: () => {print(link), launch(link)},
                    child: Text('Unirme',
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-220,
            width: double.infinity,
            margin: EdgeInsets.only(top: 220),
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color(0xFFF9FAFE),
            ),
            child: ListView(
              children: [
                ListTile(
                    title: Text(
                      "${DateFormat.jm().format(dateTime)} - ${DateFormat.jm().format(hourSum)}",
                      style: const TextStyle(
                          color: Color(0xFF343887), fontSize: 13, height: 1.7),
                    ),
                    leading:
                    Image.asset('assets/images/iconTimeStreaming.png')),
                ListTile(
                  title: Text(
                    '${days[dateMod.weekday - 1]}, ${dateMod.day} ${arrMonth[dateMod.month - 1]}',
                    style: const TextStyle(
                        color: Color(0xFF343887), fontSize: 13, height: 1.7),
                  ),
                  leading: Image.asset('assets/images/iconDateStreaming.png'),
                  trailing: Column(
                    children: [
                      Container(
                        width: 54.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff8378FC),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                        child: Image.asset('assets/images/iconStreaming.png',
                            color: Color(0xffFFFFFF)),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    "Online",
                    style: const TextStyle(
                        color: Color(0xFF343887), fontSize: 13, height: 1.7),
                  ),
                  leading:
                  Image.asset('assets/images/iconLocationStreaming.png'),
                  trailing: Text(
                    "Invitados",
                    style: const TextStyle(
                        color: Color(0xFF343887), fontSize: 13, height: 1.7),
                  ),
                ),
                BorderLine(2, 0, 0, 0xffE0E4FB),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Organiza:",
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            child: (url == null || url == '')
                                ? Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff6456EB),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(19.0)),
                              ),
                            )
                                : Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff6456EB),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      url != null ? url.toString() : ''),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(19.0)),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${firstname.toString()} ${lastname.toString()} ',
                                style: const TextStyle(
                                    color: Color(0xFF343887),
                                    fontSize: 13,
                                    height: 1.7),
                              ),
                              Text(
                                "Admin",
                                style: const TextStyle(
                                    color: Color(0xFF343887),
                                    fontSize: 13,
                                    height: 1.7),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Orden del día:",
                  style: const TextStyle(
                      color: Color(0xFF343887),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                        height: 5,
                        width: 5,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        )),
                    SizedBox(width: 15),
                    Flexible(
                      child: Text(
                        description.toString(),
                        style: const TextStyle(
                            color: Color(0xFF343887),
                            fontSize: 13,
                            height: 1.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () => {print(link), launch(link.toString())},
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
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    child: Text(
                      'Unirme a la reunión',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff7B6FFA).withOpacity(0.34),
                          spreadRadius: 0,
                          blurRadius: 9,
                          offset:
                          const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionBtn(),
      bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
    );
  }
}
