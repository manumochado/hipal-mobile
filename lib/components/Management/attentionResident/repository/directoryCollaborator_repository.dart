import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class DirectoryCollaboratorRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getSchedueleResident(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/directory-collaborators?position=Admin',
        module: "Directorio de Colaboradores");
    if (response != null && response.statusCode == 200) {}

    return response;
  }
}
