import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class LockerRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getlockers(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/lockers$params',
        module: "Casilleros");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> editLocker(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendUpdate('$apiHost/lockers/$id/$params', "", module: "Casilleros");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
