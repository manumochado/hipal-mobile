import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class ManagementReportsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getDocumentsManagements(BuildContext context) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/managements', module: "Gestiones");
    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getManagementReporsShears(
      BuildContext context, params) async {
    print("getAdvertisementsShears ${params}");
    final httpService = new HttpService(context);

    final response = await httpService.sendGet('$apiHost/managements$params',
        module: "Gestiones");

    if (response != null && response.statusCode == 200) {
      print("****** 200");
      return response;
    } else {
      print("****** else ${response!.statusCode}");
    }

    return null;
  }
}
