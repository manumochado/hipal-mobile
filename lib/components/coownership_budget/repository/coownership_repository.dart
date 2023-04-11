import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class CoownershipRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getCoownership(BuildContext context, params) async {
    print("**************** CoownershipRepository getCoownership");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/goals-egresses$params',
        module: "Metas y Egresos");

    if (response != null && response.statusCode == 200) {
      print("******* lista de egresos OK");
    } else {
      print("******* Error ${response?.statusCode}");
    }

    return response;
  }
}
