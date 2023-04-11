import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class StreamingsRepository {
  final String apiHost = Environment().config.apiHost;
  Future<dynamic> getStreamings(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendGet('$apiHost/streamings', module: "Streamings");
    print(response);
    if (response != null) {}

    return response;
  }

  Future<dynamic> getStreamingsForId(BuildContext context, id) async {
    print('id en el getStreamingsForId del repository');
    print(id);
    final httpService = new HttpService(context);

    final response = await httpService.sendGet('$apiHost/streamings/$id',
        module: "Streamings");
    if (response != null) {}

    return response;
  }
}
