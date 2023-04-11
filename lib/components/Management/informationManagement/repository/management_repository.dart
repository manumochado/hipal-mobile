import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class ManagementRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getInformationManagement(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/curriculum-vitaes',
        module: "Curriculum");
    print('curriculum-vitaes en el repository');
    print(response);
    print(':::::: ::::::::::: ::::::::::: :::::::::: :::::::::');
    if (response != null && response.statusCode == 200) {}

    return response;
  }
}
