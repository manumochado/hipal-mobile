import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class ApartamentRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getApartament(BuildContext context, String id) async {
    final httpService = new HttpService(context);
    print('$apiHost/apartments/me/$id');
    final response = await httpService.sendGet('$apiHost/apartments/me/$id',
        module: "Apartamento");

    if (response != null && response.statusCode == 200) {
      print(response.statusCode);
      print(response);
    }
    return response;
  }

  Future<dynamic> editApartament(
      BuildContext context, String id, params) async {
    final httpService = new HttpService(context);
    print(params);
    print('$apiHost/apartments/$id');
    final response = await httpService.sendUpdate(
        '$apiHost/apartments/me/$id', params,
        module: "Apartamento", contentJson: true);

    if (response != null && response.statusCode == 200) {
      print(response.statusCode);
      print(response);
    }
    return response;
  }
}
