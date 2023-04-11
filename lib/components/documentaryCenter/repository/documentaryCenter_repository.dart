import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class DocumentaryCenterRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getDocuments(BuildContext context, params) async {
    print("+++++++++++++++++++++++++ DocumentaryCenterRepository getDocuments");
    print(params);
    print("+++++++++++++++++++++++++ ");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/documentary-centers$params',
        module: "Centros Documentarios");
    if (response != null && response.statusCode == 200) {
      print("******* los documentos ok 200");
    } else {
      print("******* ERROR ${response?.statusCode}");
    }

    return response;
  }

  Future<dynamic> searchCategories(BuildContext context, searchText) async {
    print(
        "+++++++++++++++++++++++++ DocumentaryCenterRepository searchCategories");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/documentary-centers?nameCategory=$searchText',
        module: "Centros Documentarios");
    if (response != null && response.statusCode == 200) {
      print("******* la busqueda ok 200");
    } else {
      print("******* ERROR ${response?.statusCode}");
    }

    return response;
  }

  Future<dynamic> getDocumentForId(BuildContext context, id) async {
    print(
        "+++++++++++++++++++++++++ DocumentaryCenterRepository getDocumentForId");
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/documentary-centers/${id}',
        module: "Centros Documentarios");
    if (response != null && response.statusCode == 200) {
      print("******* documento by id ok 200");
    } else {
      print("******* ERROR ${response?.statusCode}");
    }

    return response;
  }
}
