import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/sos/repository/sos_repository.dart';
import 'package:hipal/components/sos/ui/widgets/request.dart';

import '../../../chats/model/ChatResponse.dart';

class SOSScreen extends StatefulWidget {
  @override
  _SOSScreen createState() => _SOSScreen();
}

class _SOSScreen extends State<SOSScreen> {
  // List<Notificationapp> items =  [];
  // late FocusNode _focus = FocusNode();
  // late TextEditingController _controller = TextEditingController(text: "");
  late final SosRepository sosRepo = new SosRepository();
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
    // BlocProvider.of<SosBloc>(context).add(GetEmergency(context));
  }

  _asyncMethod() async {
    BlocProvider.of<SosBloc>(context).add(ChangeStatusEmergency(false));
    final response = await sosRepo.getEmergency(context, true);
    BlocProvider.of<SosBloc>(context).add(ChangeStatusEmergency(true));

    if (response != null && response.statusCode == 200) {
      final emergencyResponse = json.decode(response.body);
      print("emergencyResponse");
      print(emergencyResponse);

      if (emergencyResponse['status'] != null &&
          emergencyResponse['status'] == "Opened") {
        final chat = ChatResponse.fromJson(emergencyResponse['chat']);
        if (chat != null) {
          BlocProvider.of<ChatsBloc>(context).add(ChatView(chat));
          BlocProvider.of<MessagesBloc>(context)
              .add(TypeMessages("Emergency", emergencyResponse['_id']));
          BlocProvider.of<MessagesBloc>(context).add(MessageClear());
          BlocProvider.of<MessagesBloc>(context).add(LoadIdChat(chat));
          BlocProvider.of<MessagesBloc>(context)
              .add(LoadRefreshMessages(context));
          Navigator.pushNamed(context, 'messages');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SosBloc, SosState>(builder: (context, state) {
      return RequestEmergency();
    });
  }
}
