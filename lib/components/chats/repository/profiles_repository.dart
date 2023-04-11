import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ProfilesRepository {
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

  Future<dynamic> initProfile(BuildContext context, bool isInitSocket) async {
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

      this.socket.onConnect((_) {});
    }
  }

  Future<dynamic> getProfiles(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/profiles-users/$params');
    return response;
  }
}
