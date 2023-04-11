import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class VisitorsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getVisitors(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/visitors$params',
        module: "Visitantes");
    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> saveVisitors(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/visitors', params,
        module: "Visitantes");
    if (response != null && response.statusCode == 200) {
      print("********** Ok 200");
    } else {
      print("********** Error ${response?.statusCode}");
    }
    return response;
  }

  Future<dynamic> deleteVisitors(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete('$apiHost/visitors/$id', {},
        module: "Visitantes");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> editVisitors(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendUpdate('$apiHost/visitors/$id', params, module: "Visitantes");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
