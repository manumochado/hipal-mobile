import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class DeliveriesRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getDeliveries(BuildContext context, params) async {
    print("------------------ DeliveriesRepository getDeliveries");
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/type-deliveries${params}', module: "Domicilios");
    if (response != null && response.statusCode == 200) {
      print("ok 200");
      return response;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(
          context, "Error al traer la lista de domiciliots");
    }
    return null;
  }

  Future<dynamic> getTypesDelivery(BuildContext context, params) async {
    print("------------------ DeliveriesRepository getTypesDelivery");
    print(params);
    final httpService = new HttpService(context);
    print(httpService);
    final response = await httpService
        .sendGet('$apiHost/type-deliveries?$params', module: "Domicilios");
    print(response?.statusCode);
    if (response != null && response.statusCode == 200) {}

    return response;
  }
}
