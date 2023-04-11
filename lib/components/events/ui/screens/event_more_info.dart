import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/events/bloc/event_register/event_register_bloc.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/events/model/event_register.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/widgets/appbar_back_search.dart';
import 'package:intl/intl.dart';

class EventMoreInfo extends StatefulWidget {
  int eventId;

  EventMoreInfo({required this.eventId});

  _EventMoreInfo createState() => _EventMoreInfo();
}

class _EventMoreInfo extends State<EventMoreInfo> {
  List<EventRegister> items = [];
  List<Events> eventItems = [];
  String idEvent = "";
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EventsBloc>(context).add(ChangeFromScreen("events"));
    eventItems = (BlocProvider.of<EventsBloc>(context).state.events != null
        ? BlocProvider.of<EventsBloc>(context).state.events
        : [])!;
    String date = DateFormat('yyyy/MM/dd')
        .format(eventItems[widget.eventId].date!)
        .toString();
    String hour = eventItems[widget.eventId].hour.toString();
    String title = eventItems[widget.eventId].name.toString();
    String dateHour = date + " , " + hour;

    final card = Container(
        height: 75.0,
        width: 245.0,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment(0, 1.0),
                    colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        color: const Color(0xff6456EB),
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              eventItems[widget.eventId].imageOrganizer?.url !=
                                      null
                                  ? eventItems[widget.eventId]
                                      .imageOrganizer!
                                      .url
                                      .toString()
                                  : ""),
                        ))),
              ),
              Container(
                  width: 175.0,
                  margin: const EdgeInsets.only(left: 11, top: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                              eventItems[widget.eventId]
                                  .nameOrganizer
                                  .toString(),
                              style: TextStyle(
                                color: Color(0xff343887),
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 17,
                              )),
                        ),
                        Flexible(
                            child: Text(
                                eventItems[widget.eventId]
                                    .residential!
                                    .name
                                    .toString(),
                                style: TextStyle(
                                  color: Color(0xff343887),
                                  fontSize: 15,
                                )))
                      ]))
            ]));

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarBackSearch(
            color_buttons: 0xFFF8F8F8,
            color_title: 0xFFF8F8F8,
            color_background: 0xFF6456EB,
            name_title: 'Eventos',
            view: 'events',
            with_search: false),
        body: BlocBuilder<EventRegisterBloc, EventRegisterState>(
            builder: (context, state) {
          items = (state.eventsRegister != null ? state.eventsRegister : [])!;
          for (int i = 0; i < items.length; i++) {
            if (eventItems[widget.eventId].id == items[i].event?.id) {
              try {
                isSubscribed = true;
                print("############ Encontrado en la info");
              } catch (e) {}
              idEvent = items[i].id.toString();
            }
          }
          return Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(eventItems[widget.eventId]
                            .imageEvent!
                            .url
                            .toString())),
                    shape: BoxShape.rectangle),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 34, right: 34, bottom: 47),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe92A, fontFamily: 'icomoon'),
                                color: Color(0xFF8378FC),
                                size: 25,
                              ),
                              Container(
                                width: 20,
                              ),
                              Text(
                                dateHour,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8378FC)),
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe908, fontFamily: 'icomoon'),
                                color: Color(0xFF8378FC),
                                size: 25,
                              ), //reemplazar icon
                              Container(
                                width: 20,
                              ),
                              Text(
                                eventItems[widget.eventId].site.toString(),
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5F5E88)),
                              )
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            eventItems[widget.eventId].description.toString(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5F5E88)),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "Organiza:",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 63, 56, 141)),
                          ),
                          Container(
                            height: 20,
                          ),
                          card,
                          Container(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 120),
                              child: _inscribirme_button(context)),
                          Container(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  _inscribirme_button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(
            color: Color(0xff7E72FF),
          ),
        ),
        color: const Color(0xFF776BF8),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(
            !isSubscribed ? 'Inscribirme' : 'Inscrito',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16,
            ),
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
        onPressed: !isSubscribed
            ? () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: const Text('Por favor confirme'),
                        content: const Text('¿Desea inscribirse en el evento?'),
                        actions: [
                          // The "Yes" button
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  this.isSubscribed = true;
                                });
                                // Close the dialog
                                BlocProvider.of<EventRegisterBloc>(context).add(
                                    CreateEventRegister(
                                        context,
                                        eventItems[widget.eventId]
                                            .id
                                            .toString()));
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: const Text('Si')),
                          TextButton(
                              onPressed: () {
                                // Close the dialog
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: const Text('No'))
                        ],
                      );
                    });
              }
            : () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: const Text('Por favor confirme'),
                        content: const Text('¿Desea desinscribirse al evento?'),
                        actions: [
                          // The "Yes" button
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  print("################## Entro");
                                  this.isSubscribed = false;
                                });
                                // Close the dialog
                                BlocProvider.of<EventRegisterBloc>(context).add(
                                    deleteEventRegister(
                                        context,
                                        eventItems[widget.eventId]
                                            .id
                                            .toString()));
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: const Text('Si')),
                          TextButton(
                              onPressed: () {
                                // Close the dialog
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: const Text('No'))
                        ],
                      );
                    });
              },
      ),
    );
  }
}
