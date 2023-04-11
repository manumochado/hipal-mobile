import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class AssemblyCommentRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getAssemblyComment(
      BuildContext context, String params) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/comment-assemblies$params');
    if (response != null && response.statusCode == 200) {
    } else if (response?.statusCode == 400) {
      httpService.errorManager(
          context, "Error al traer la lista de comentarios de clasificados");
    }
    return response;
  }

  Future<dynamic> saveCommentAssembly(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendPost('$apiHost/comment-assemblies', params);
    if (response != null) {}

    return response;
  }

  Future<dynamic> deleteComment(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendDelete('$apiHost/comment-assemblies/${id}', "");

    if (response != null && response.statusCode == 200) {
    } else {
    }

    return response;
  }
}
