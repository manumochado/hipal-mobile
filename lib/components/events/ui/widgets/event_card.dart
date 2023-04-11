import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/events/bloc/event_register/event_register_bloc.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/events/model/event_register.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:intl/intl.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/components/events/ui/screens/event_more_info.dart';
import 'package:hipal/components/events/ui/widgets/favorite_icon.dart';

class EventCard extends StatefulWidget {
  int event;
  double imageSize;

  EventCard({required this.event, required this.imageSize});

  _EventCard createState() => _EventCard();
}

class _EventCard extends State<EventCard> {
  List<EventRegister> items = [];
  String idEvent = "";
  bool isSubscribed = false;
  bool isFavorite = false;
  List<Events> eventItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    eventItems = (BlocProvider.of<EventsBloc>(context).state.events != null
        ? BlocProvider.of<EventsBloc>(context).state.events
        : [])!;
    String date = DateFormat('yyyy/MM/dd')
        .format(eventItems[widget.event].date!)
        .toString();
    isFavorite = eventItems[widget.event].stated == "0" ? false : true;
    return BlocBuilder<EventRegisterBloc, EventRegisterState>(
        builder: (context, state) {
      items = (state.eventsRegister != null ? state.eventsRegister : [])!;
      for (int i = 0; i < items.length; i++) {
        if (eventItems[widget.event].id == items[i].event?.id) {
          try {
            isSubscribed = true;
          } catch (e) {}
          idEvent = items[i].id.toString();
        }
      }
      return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EventMoreInfo(eventId: widget.event)),
                  );
                },
                child: Container(
                  //imagen
                  height: widget.imageSize, //pasar por parametro
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(bottom: 40, top: 40, left: 40, right: 40),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              eventItems[widget.event].imageEvent?.url != null
                                  ? eventItems[widget.event]
                                      .imageEvent!
                                      .url
                                      .toString()
                                  : '')),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      shape: BoxShape.rectangle),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 45),
                child: Column(
                  children: [
                    Row(
                      //fecha
                      children: [
                        Icon(
                          const IconData(0xe92A, fontFamily: 'icomoon'),
                          color: Color(0xFF8378FC),
                          size: 12,
                        ),
                        Container(
                          width: 20,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5F5E88)),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        eventItems[widget.event].name.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF8378FC)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  mini: true,
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      this.isFavorite = !isFavorite;
                                      BlocProvider.of<EventsBloc>(context).add(
                                          ChangeStateEvent(
                                              isFavorite ? "1" : "0",
                                              eventItems[widget.event]));
                                    });
                                    BlocProvider.of<EventsBloc>(context).add(
                                        favoriteEvent(
                                            context,
                                            eventItems[widget.event]
                                                .id
                                                .toString(),
                                            eventItems[widget.event].stated ==
                                                    "0"
                                                ? "1"
                                                : "0"));
                                  },
                                  heroTag: null,
                                  elevation: 0,
                                ),
                                Text(
                                  "Me interesa",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFB1B4C7)),
                                )
                              ],
                            ),
                          ),
                          _inscribirme_button(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      );
    });
  }

  _inscribirme_button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 40),
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
                                        eventItems[widget.event]
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
                                  this.isSubscribed = false;
                                });
                                // Close the dialog
                                BlocProvider.of<EventRegisterBloc>(context)
                                    .add(deleteEventRegister(context, idEvent));
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
