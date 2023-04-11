import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/components/pets/model/pet.dart';
import 'package:hipal/serializers/pagination.dart';

class PetsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getPets(BuildContext context, params) async {
    print("pets_repository getPets");
    final httpService = new HttpService(context);

    final response =
        await httpService.sendGet('$apiHost/pets$params', module: "Mascotas");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getTypesPet(BuildContext context, params) async {
    print("pets_repository getTypesPet");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/type-pets$params',
        module: "Tipos de Mascotas");
    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> savePet(BuildContext context, params) async {
    final httpService = new HttpService(context);
    print("pets_repository savePet");

    final response =
        await httpService.sendPost('$apiHost/pets', params, module: "Mascotas");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> editPet(BuildContext context, String id, params) async {
    print("pets_repository editPet");
    final httpService = new HttpService(context);

    final response = await httpService.sendUpdate('$apiHost/pets/$id', params,
        module: "Mascotas");

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> deletePet(BuildContext context, id) async {
    print("pets_repository deletePet");
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/pets/$id', {},
        module: "Mascotas");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
