import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class PowersRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getPowers(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendGet('$apiHost/assemblies$params');

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> savePowers(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendPost('$apiHost/authorization-powers', params);

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> savePowersV2(BuildContext context, params) async {

    print('params: $params');
    final httpService = new HttpService(context);

    final response =
        await httpService.sendPost('$apiHost/authorization-powers', params);

    if (response != null && response.statusCode == 200) {
      print('todo bien');
    }else{
      print('todo mal');
    }
    return response;
  }

  Future<dynamic> editPowers(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendUpdate(
        '$apiHost/authorization-powers/$id', params);

    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> deletePower(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendDelete('$apiHost/authorization-powers/$id', {});

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
