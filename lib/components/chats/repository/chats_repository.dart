import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../utils/log_utils.dart';
import '../model/ChatResponse.dart';

class ChatsRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  late BuildContext context;
  late bool isInitialized = true;
  late IO.Socket socket = IO.io(apiHost);

  changeContext(BuildContext context) {
    this.context = context;
  }

  Future<IO.Socket> socketRepo() async {
    return this.socket;
  }

  Future<dynamic> initChat(BuildContext context, bool isInitSocket) async {
    this.context = context;
    if (!isInitSocket) {
      dynamic cookie = await storage.read(key: 'cookie');

      this.socket = IO.io(
          apiHost,
          IO.OptionBuilder()
              .setTransports(['websocket', 'polling'])
              .disableAutoConnect()
              .setExtraHeaders({'cookie': cookie})
              .build());
      this.socket.connect();

      this.socket.onConnect((_) {
        this.socket.emit('loggedIn', {});
        this.socket.emit('getChatNotViews', {});
      });

      this.socket.on('chatNotViewResponse', (data) {
        BlocProvider.of<ChatsBloc>(this.context).add(ChangeNotView(data));
      });

      final user = await storage.read(key: 'userLogged');
      final Map<String, dynamic> userDecode = json.decode(user!);
      final UserInfo? userModel = UserInfo.fromJson(userDecode);

      this.socket.on('messageNewResponse', (data) async {
        LogUtils().logInfo(data.toString());
        BlocProvider.of<ChatsBloc>(this.context)
            .add(NewChatMessage(ChatResponse.fromJson(data['chat'])));
        data['message']['isSender'] =
            (userModel?.user?.id != data['message']['user_send']['_id'])
                ? false
                : true;
        data['message']['messageType'] = (data['message']['type'] != "Message")
            ? data['message']['type'].toLowerCase()
            : "text";
        BlocProvider.of<MessagesBloc>(this.context)
            .add(NewMessage(Message.fromJson(data['message']) as Message));

        if (data['message']['type'] == "Emergency" &&
            data['message']['message'] == 'Finaliza Emergencia') {
          BlocProvider.of<MessagesBloc>(this.context).add(TypeMessages("", ""));
          BlocProvider.of<SosBloc>(this.context).add(ChangeIsEmergency(false));
        }
      });
    }
  }

  Future<dynamic> chatView(String id) async {
    dynamic cookie = await storage.read(key: 'cookie');

    if (!this.isInitialized) {
      this.isInitialized = true;
      this.socket = IO.io(
          apiHost,
          IO.OptionBuilder()
              .setTransports(['websocket', 'polling'])
              .disableAutoConnect()
              .setExtraHeaders({'cookie': cookie})
              .build());
    }
    this.socket.emit('chatView', {"chat": id});
  }

  Future<dynamic> getChats(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/chats$params');
    return response;
  }

  Future<dynamic> getChatLoad(BuildContext context, chatId) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/chats/$chatId');
    if (response != null && response.statusCode == 200) {
      final chatsResponse = json.decode(response.body);
      ChatResponse chat = ChatResponse.fromJson(chatsResponse);
      BlocProvider.of<ChatsBloc>(context).add(ChatView(chat));
      BlocProvider.of<MessagesBloc>(context).add(MessageClear());
      BlocProvider.of<MessagesBloc>(context).add(LoadIdChat(chat));
      BlocProvider.of<MessagesBloc>(context).add(LoadRefreshMessages(context));
      Navigator.pushNamed(context, 'messages');
    }

    return response;
  }

  Future<dynamic> createChat(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendPost('$apiHost/chats', params);

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> toogleUsersChat(BuildContext context, params) async {
    final httpService = new HttpService(context);
    BlocProvider.of<ChatsBloc>(context).add(ChangeLoadingToggle(true));
    final response =
        await httpService.sendUpdate('$apiHost/chats/me/toggle', params);

    if (response != null && response.statusCode == 200) {
      BlocProvider.of<ChatsBloc>(context).add(ChangeLoadingToggle(false));
    } else {
      BlocProvider.of<ChatsBloc>(context).add(ChangeLoadingToggle(false));
    }
    return response;
  }
}
