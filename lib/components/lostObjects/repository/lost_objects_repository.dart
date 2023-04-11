import 'package:flutter/material.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class LostObjectsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getLostObjects(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendGet('$apiHost/lost-objects$params',
        module: "Objetos Perdidos");

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> editLostObject(
      BuildContext context, String id, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendUpdate(
        '$apiHost/lost-objects/$id/$params', "",
        module: "Objetos Perdidos");

    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
