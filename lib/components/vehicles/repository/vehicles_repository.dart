import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:hipal/serializers/pagination.dart';

class VehiclesRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getVehicles(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/vehicles$params',
        module: "Vehiculos");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getTypesVehicle(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/type-vehicles$params',
        module: "Tipo de vehiculos");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> saveVehicle(BuildContext context, params) async {
    final httpService = new HttpService(context);
    print(params);

    final response = await httpService.sendPost('$apiHost/vehicles', params,
        module: "Vehiculos");

    if (response != null && response.statusCode == 200) {
      print("200");
    } else {
      print(response?.statusCode);
    }
    return response;
  }

  Future<dynamic> editVehicle(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendUpdate('$apiHost/vehicles/$id', params, module: "Vehiculos");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> deleteVehicle(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/vehicles/$id', {},
        module: "Vehiculos");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
