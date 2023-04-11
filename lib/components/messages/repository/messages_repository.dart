import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/notifications/notification.dart';
import 'package:hipal/services/http.dart';

import '../../chats/model/ChatResponse.dart';

class MessagesRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  late BuildContext context;

  Future<dynamic> getMessages(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendGet('$apiHost/messages$params',
        module: "Mensajes");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> sendMessage(
      BuildContext context, ChatResponse chatComplete, String message) async {
    final firebaseMessaging = FCM();
    final token = await firebaseMessaging.getToken();

    final httpService = new HttpService(context);
    final response = await httpService.sendPost(
        '$apiHost/messages',
        {
          "chat": chatComplete.id.toString(),
          "message": message,
          "tokenFCM": token
        },
        module: "Mensajes");
    if (response != null && response.statusCode == 200) {}

    return response;
  }
}
