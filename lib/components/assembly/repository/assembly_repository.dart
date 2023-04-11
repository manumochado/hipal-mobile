import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class AssemblyRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getRulesAssembly(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/rules?isVisible=true',
        module: "Reglas");
    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getCallsAssembly(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/assemblies/62869e60d2f8f9109dc8e5bf',
        module: "Ensambles");
    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getCurrentlyAssembly(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/assemblies?startDate=0', module: "Ensambles");
    if (response != null && response.statusCode == 200) {}
    return response;
  }

  Future<dynamic> getHistoryAssembly(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/assemblies?startDate=1', module: "Ensambles");
    if (response != null && response.statusCode == 200) {}
    return response;
  }
}
