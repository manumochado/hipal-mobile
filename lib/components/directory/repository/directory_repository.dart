import 'package:flutter/material.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class DirectoryRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getDirectoryEmergency(BuildContext context, params) async {
    print("getDirectoryEmergency ${params}");
    final httpService = new HttpService(context);

    final response = await httpService.sendGet(
        '$apiHost/directory-emergencies$params',
        module: "Directorio de Emergencias");

    if (response != null && response.statusCode == 200) {
      print("****** 200");
      return response;
    } else {
      print("****** else ${response!.statusCode}");
    }

    return null;
  }

  Future<dynamic> getDirectoryResidential(BuildContext context, params) async {
    print("getDirectoryProfile ${params}");
    final httpService = new HttpService(context);

    final response = await httpService.sendGet(
        '$apiHost/directory-residentials$params',
        module: "Directorio de Residencias");

    if (response != null && response.statusCode == 200) {
      print("****** 200");
      return response;
    } else {
      print("****** else ${response!.statusCode}");
    }

    return null;
  }
}
