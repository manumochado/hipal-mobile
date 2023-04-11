import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class EventRegisterRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getEventRegister(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/event-register$params',
        module: "Eventos de registro");

    if (response != null && response.statusCode == 200) {
      return response;
    } else {
      print(response?.statusCode);
    }

    return response;
  }

  Future<dynamic> postEventRegister(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost(
        '$apiHost/event-register', params,
        module: "Eventos de Registro");

    if (response != null && response.statusCode == 200) {
      print("Repository postEventRegister ${response.statusCode}");
      return response;
    } else {
      print(response?.statusCode);
    }

    return response;
  }

  Future<dynamic> deleteEventRegister(BuildContext context, id) async {
    print("***** EventRegisterRepository deleteEventRegister ${id}");
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete(
        '$apiHost/event-register/${id}', "",
        module: "Eventos de Registro");

    return response;
  }
}
