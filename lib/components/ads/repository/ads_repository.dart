import 'package:flutter/material.dart';
import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class AdsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getAds(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/advertisements/$params', module: "Anuncios");

    if (response != null && response.statusCode == 200) {
      return response;
    } else {
      print(response?.statusCode);
    }
    return response;
  }

  Future<dynamic> getAdsById(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/advertisements/$params', module: "Anuncios");
    if (response != null && response.statusCode == 200) {
      return response;
    } else {
      print(response?.statusCode);
    }
    return response;
  }
}
