import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class ProviderRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getProvider(BuildContext context, String? providerId) async {
    if (providerId != null) {
      final httpService = new HttpService(context);
      final response = await httpService
          .sendGet('$apiHost/providers/$providerId', module: "Proveedores");

      if (response != null && response.statusCode == 200) {}
      print(
          "response body provider $apiHost/providers/$providerId ${response?.body}");
      return response?.body;
    }
    return null;
  }
}
