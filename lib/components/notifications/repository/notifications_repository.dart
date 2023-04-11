import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class NotificationsRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  late BuildContext context;
  late final IO.Socket socket;
  late final bool isInitialized;

  changeContext(BuildContext context) {
    this.context = context;
  }

  Future<IO.Socket> socketRepo() async {
    return this.socket;
  }

  Future<dynamic> initNotification(
      BuildContext context, bool isInitSocket) async {
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
      this.isInitialized = true;

      this.socket.connect();

      this.socket.onConnect((_) {
        this.socket.emit('loggedIn', {});
      });

      this.socket.on(
          'notificationsViews',
          (data) => {
                BlocProvider.of<NotificationsBloc>(this.context)
                    .add(ChangeNotView(data)),
              });
    }
  }

  Future<dynamic> getNotifications(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendGet('$apiHost/notifications$params',
        module: "Notificaciones");

    return response;
  }

  Future<dynamic> getUnviewedNotifications(BuildContext context) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/notifications/unviewed/count');

    return response;
  }

  Future<dynamic> saveNotification(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendPost('$apiHost/notifications', params, module: "Notificaciones");
    return response;
  }

  Future<dynamic> editNotification(
      BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendUpdate(
        '$apiHost/notifications/$id', params,
        module: "Notificaciones");
    return response;
  }

  Future<dynamic> setViewAllNotifications(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendUpdate('$apiHost/notifications', {},
        module: "Notificaciones");
    return response;
  }

  Future<dynamic> setViewNotificationsByType(BuildContext context, {required String type}) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendUpdate('$apiHost/notifications/type/${type}', {},
        module: "Notificaciones");

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> deleteNotification(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendDelete('$apiHost/notifications/$id', {}, module: "Notificaciones");
    return response;
  }
}
