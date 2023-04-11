import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class AddreesDeliveriesRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getAddressDeliveries(
      BuildContext context, String params) async {
    print("++++ AddreesDeliveriesRepository getAddressDeliveries ${params}");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/directory-deliveries$params',
        module: "Directorio de Entregas");
    if (response != null && response.statusCode == 200) {
      print("++++++ ok 200 AddreesDeliveriesRepository");
      return response;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(
          context, "Error al traer la lista de domiciliots");
    } else {
      print("error ${response?.statusCode}");
    }
    return null;
  }

  Future<dynamic> getTypesAddressDelivery(
      BuildContext context, String parametro) async {
    print(
        "++++ AddreesDeliveriesRepository getTypesAddressDelivery ${parametro}");
    final httpService = new HttpService(context);

    final response = await httpService.sendGet(
        '$apiHost/directory-deliveries?page=1&type=$parametro',
        module: "Directorio de Entregas");
    if (response != null && response.statusCode == 200) {
      print("ok 200");
    } else {
      print("error ${response?.statusCode}");
    }

    return response;
  }
}
