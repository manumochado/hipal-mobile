import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

import '../bloc/service_bloc.dart';

class ServiceRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getService(BuildContext context, params) async {
    print("*********    Repository getService ***********");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/services$params',
        module: "Servicios");

    if (response != null && response.statusCode == 200) {
      print("************* 200");
    }

    return response;
  }

  Future<dynamic> editService(BuildContext context, String id, params) async {
    print("*********    Repository editService ***********");
    final httpService = new HttpService(context);

    final response = await httpService
        .sendUpdate('$apiHost/services/$id', params, module: "Servicios");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> createService(BuildContext context, params) async {
    print("*********    Repository createService ***********");
    final httpService = new HttpService(context);

    final response = await httpService.sendPost('$apiHost/services', params,
        module: "Servicios");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> deleteService(BuildContext context, id) async {
    print("*********    Repository deleteService ***********");
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/services/$id', {},
        module: "Servicios");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
