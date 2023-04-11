import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class EventsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getEvents(BuildContext context, params) async {
    print("*******Event getEvents ${params}");
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/events$params', module: "Eventos");

    if (response != null && response.statusCode == 200) {
      return response;
    } else {
      print(response?.statusCode);
    }

    return response;
  }

  Future<dynamic> setFavoriteEvent(BuildContext context, id, value) async {
    print("*******Event setFavoriteEvent $id/$value");
    final httpService = new HttpService(context);
    final response = await httpService
        .sendUpdate('$apiHost/events/$id/$value', "", module: "Eventos");

    if (response != null && response.statusCode == 200) {
      print("setFavoriteEvent 200");
      return response;
    } else {
      print(response?.statusCode);
    }

    return response;
  }
}
