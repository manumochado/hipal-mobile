import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class CommentRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getComment(BuildContext context, String params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/comment$params',
        module: "Comentarios");
    if (response != null && response.statusCode == 200) {
    } else if (response?.statusCode == 400) {
      httpService.errorManager(
          context, "Error al traer la lista de comentarios de domicilios");
    }
    return response;
  }

  Future<dynamic> saveComment(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/comment', params,
        module: "Comentarios");
    print(response);
    if (response != null && response.statusCode == 200) {
    } else {}

    return response;
  }

  Future<dynamic> deleteComment(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete('$apiHost/comment/${id}', "",
        module: "Comentarios");

    if (response != null && response.statusCode == 200) {
    } else {}

    return response;
  }
}
