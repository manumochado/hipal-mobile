import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/user/model/userInfo.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SosRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  late BuildContext context;
  // late SosBloc _sosBloc = SosBloc(sosRepo: this);

  // late final IO.Socket socket;
  late final bool isInitialized;

  Future<dynamic> createEmergency(
      BuildContext context, bool isInitSocket) async {
    print("*** createEmegency ***");
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/emergencies', {},
        module: "Emergencias");
    if (response != null && response.statusCode == 200) {
      final emergencyResponse = json.decode(response.body);
    }
    return response;
  }

  Future<dynamic> getEmergency(BuildContext context, bool isInitSocket) async {
    print("*** getEmergency ***");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/emergencies/me',
        module: "Emergencias");
    return response;
  }

  Future<dynamic> closedEmergency(BuildContext context, String id) async {
    print("*** getEmergency ***");
    final httpService = new HttpService(context);
    final response = await httpService.sendUpdate(
        '$apiHost/emergencies/$id', {"status": "Closed"},
        module: "Emergencias");
    return response;
  }

  Future<dynamic> chatView(String id) async {}
}
