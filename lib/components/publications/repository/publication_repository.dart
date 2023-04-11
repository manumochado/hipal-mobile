import 'package:flutter/material.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class PublicationRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getPublication(
      BuildContext context, String publicationId) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/publications/$publicationId',
        module: "Publicaciones");

    if (response != null && response.statusCode == 200) {}
    print("response body get publication ${response?.body}");
    return response?.body;
  }

  Future<dynamic> getPublicationsFromProvider(
      BuildContext context, String? providerId, String publicationId) async {
    if (providerId != null) {
      final httpService = new HttpService(context);
      final response = await httpService.sendGet(
          '$apiHost/publications?filters=provider==$providerId;_id!=$publicationId',
          module: "Publicaciones");

      if (response != null && response.statusCode == 200) {}
      print("response body publications by provider ${response?.body}");
      return response?.body;
    }

    return null;
  }

  Future<dynamic> getPublicabionsByResidential(
      BuildContext context, String params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/publications/me/residential_location$params',
        module: 'Publicaciones');

    if (response?.statusCode == 200) {
      print("response body ${response?.body}");
      return response?.body;
    }
    return null;
  }
}
