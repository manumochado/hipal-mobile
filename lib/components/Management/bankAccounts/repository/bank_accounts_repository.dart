import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class BankAccountsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getBanckAccount(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/bank-accounts',
        module: "Cuentas Bancarias");
    if (response != null && response.statusCode == 200) {}

    return response;
  }
}
