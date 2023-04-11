import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/menu.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/sos/repository/sos_repository.dart';
import 'package:hipal/components/sos/ui/widgets/pulsating.dart';

import '../../../chats/model/ChatResponse.dart';

class RequestEmergency extends StatelessWidget {
  const RequestEmergency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final SosRepository sosRepo = new SosRepository();
    final storage = new FlutterSecureStorage();

    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<SosBloc, SosState>(builder: (context, state) {
      print("state.isEmergency");
      print(state.isEmergency);
      print("state.statusLoaded");
      print(state.statusLoaded);
      return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Color(0xFFD1242D),
        drawer: DrawerMainMenu(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!state.isEmergency && state.statusLoaded) ...[
                PulsatingCircleIconButton(
                  onLongPress: () async {
                    BlocProvider.of<SosBloc>(context)
                        .add(CreateEmergency(context));
                    print("CLICK onLongPress");
                    await sosRepo.createEmergency(context, state.isInitSocket);
                    print("createEmergency");

                    final response = await sosRepo.getEmergency(context, true);
                    BlocProvider.of<SosBloc>(context)
                        .add(ChangeStatusEmergency(true));
                    print("RESPONSE Status");

                    if (response != null && response.statusCode == 200) {
                      final emergencyResponse = json.decode(response.body);
                      print("emergencyResponse");
                      print(emergencyResponse);

                      if (emergencyResponse['status'] != null &&
                          emergencyResponse['status'] == "Opened") {
                        final chat =
                            ChatResponse.fromJson(emergencyResponse['chat']);
                        if (chat != null) {
                          BlocProvider.of<ChatsBloc>(context)
                              .add(ChatView(chat));
                          BlocProvider.of<MessagesBloc>(context).add(
                              TypeMessages(
                                  "Emergency", emergencyResponse['_id']));
                          BlocProvider.of<MessagesBloc>(context)
                              .add(MessageClear());
                          BlocProvider.of<MessagesBloc>(context)
                              .add(LoadIdChat(chat));
                          BlocProvider.of<MessagesBloc>(context)
                              .add(LoadRefreshMessages(context));
                          Navigator.pushNamed(context, 'messages');
                        }
                      }
                    }
                  },
                ),
                SizedBox(height: 40.0),
                Text(
                  "Mantén presionado el botón SOS durante 3 segundos para reportar tu emergencia",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFF9B5B9)),
                )
              ]
            ],
          ),
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: (MediaQuery.of(context).viewInsets.bottom > 0)
            ? Text("")
            : FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }
}
