import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/messages/ui/widgets/body.dart';
import 'package:hipal/components/messages/ui/widgets/chat_input_field.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/constants.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreen createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  List<Message> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      return Scaffold(
        appBar: (state.typeHeader == "Emergency") ? null : buildAppBar(),
        backgroundColor: kBackgroundSecond,
        body: (state.typeHeader == "Emergency")
            ? Stack(
                // width: MediaQuery.of(context).size.width,
                children: [
                  if (MediaQuery.of(context).viewInsets.bottom == 0)
                    titleEmergency(),
                  ContainerChat(
                      viewBottom: MediaQuery.of(context).viewInsets.bottom),
                ],
              )
            : Padding(
                padding: EdgeInsets.only(
                    bottom:
                        MediaQuery.of(context).viewInsets.bottom != 0 ? 70 : 5),
                child: BodyMessages()),
        bottomNavigationBar: const StickyBottomAppBar(child: ChatInputField()),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: titleChat(),
      backgroundColor: Colors.white,
      shadowColor: Color(0xFFF3F3FE),
      elevation: 0,
      toolbarHeight: 100,
    );
  }

  Widget titleEmergency() {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      return Container(
        color: const Color(0xffF9FAFE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 220,
              child: Column(children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, "dashboard");
                          },
                        )),
                    Expanded(
                        flex: 8,
                        child: Column(children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Asistencia de emergencia",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFFFFFFF)),
                          ),
                        ]))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Envíe incidencias de tu emergencia vía mensaje de texto o llamada telefónica",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xFFF9B5B9)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        _closedEmergency(context, state.idEmergency.toString());
                      },
                      child: Material(
                        color: Colors.white,
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            const IconData(0xe917, fontFamily: 'icomoon'),
                            color: Color(0xFFF1464F),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                gradient: const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment(0, 2.0),
                  colors: [Color(0xFFF1464F), Color(0xFFC71922)],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            )
            //description
          ],
        ),
      );
    });
  }

  void _closedEmergency(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea finalizar la emergencia?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<SosBloc>(context)
                        .add(ClosedEmergency(context, id));
                    Navigator.of(context).pop();
                    BlocProvider.of<MessagesBloc>(context)
                        .add(TypeMessages("", ""));
                    Navigator.pushReplacementNamed(context, "dashboard");
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Widget titleChat() {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      return Row(children: [
        BackButton(
          color: kPrimaryColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, "chat");
          },
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            ...[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                  image: DecorationImage(
                    image: state.chat!.user!.photo != null
                        ? NetworkImage(state.chat!.user!.photo!.url.toString())
                        : AssetImage('assets/images/image-default.png')
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
              ),
            ],
            SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 190,
                height: 100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.chat!.fullname != null
                            ? state.chat!.fullname.toString()
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: kTextColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${state.chat?.user?.profiles?.first.apartment?.tower?.name ?? ''}'
                        ', '
                        '${state.chat?.user?.profiles?.first.apartment?.name ?? ''}',
                        style:
                            TextStyle(fontSize: 12.0, color: kTextColorSecond),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ])),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xff8075FB),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: IconButton(
                  onPressed: () async {
                    if (state.chat?.user?.phone?.e164Number != null) {
                      await FlutterPhoneDirectCaller.callNumber(
                          state.chat?.user?.phone?.e164Number as String);
                    }
                  },
                  icon: Icon(
                    Icons.add_ic_call_outlined,
                    size: 20.0,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ]);
    });
  }
}

class StickyBottomAppBar extends StatelessWidget {
  final child;
  const StickyBottomAppBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}

class ContainerChat extends StatefulWidget {
  const ContainerChat({
    Key? key,
    this.viewBottom = 0.0,
  }) : super(key: key);

  final double viewBottom;

  @override
  State<ContainerChat> createState() => _ContainerChatState();
}

class _ContainerChatState extends State<ContainerChat> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(
            top: 10,
            bottom: widget.viewBottom != 0 ? 70.0 : 5.0,
            left: 0,
            right: 0),
        child: Container(
          // height: widget.viewBottom>0 ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/2,
          margin: EdgeInsets.only(
              top: ((widget.viewBottom > 0) ? 30.0 : 185.0), left: 5, right: 5),
          child: Column(children: [
            SizedBox(
              height: 5.0,
            ),
            BodyMessages(),
          ]),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xFFF9FAFE),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );
    });
  }
}
