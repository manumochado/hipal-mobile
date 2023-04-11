import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:hipal/serializers/pagination.dart';

class FamiliesRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getFamilies(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/families$params',
        module: "Familias");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getTypesFamily(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/type-families$params',
        module: "Familias");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> saveFamily(BuildContext context, params) async {
    final httpService = new HttpService(context);
    print(
        '*************** params de families_repositori ********************* ');
    print(params);
    print(
        '**********************************************************************');

    final response = await httpService.sendPost('$apiHost/families', params,
        module: "Familias");
    print(response);
    print(response?.statusCode);
    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> editFamily(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);
    print("********** Repository");
    print(id);
    print(params);
    final response = await httpService
        .sendUpdate('$apiHost/families/$id', params, module: "Familias");
    print("Repository ${response}");
    print("Repository ${response?.statusCode}");
    if (response != null && response.statusCode == 200) {
      print("Repository editFamily 200");
      return response;
    }
    return null;
  }

  Future<dynamic> deleteFamily(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/families/$id', {},
        module: "Familias");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
