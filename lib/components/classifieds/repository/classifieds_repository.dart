import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:hipal/components/classifieds/ui/widgets/detailsClassified.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';
import 'package:http/http.dart' as http;

class ClassifiedsRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getclassified(BuildContext context, String params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/classifieds$params',
        module: "Clasificados");

    return response;
  }

  Future<dynamic> loadClassifield(BuildContext context, String id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/classifieds/$id',
        module: "Clasificados");

    if (response != null && response.statusCode == 200) {
      return response;
    }
  }

  Future<dynamic> saveClassified(BuildContext context, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.post(
          Uri.parse('$apiHost/classifieds'), //your address here
          body: encodedData,
          headers: headers);

      if (response != null) {}
      return response;
    } finally {
      client.close();
    }
  }

  Future<dynamic> editClassified(
      BuildContext context, String id, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.put(
          Uri.parse('$apiHost/classifieds/$id'), //your address here
          body: encodedData,
          headers: headers);

      if (response != null) {}
      return response;
    } finally {
      client.close();
    }
  }

  Future<bool> DeleteClassified(BuildContext context, id) async {
    try {
      final httpService = new HttpService(context);
      final response = await httpService
          .sendDelete('$apiHost/classifieds/$id', {}, module: "Classifieds");

      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (e.toString().contains('ancestor is unsafe')) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<dynamic> likeClassified(
      BuildContext context, String classifiedId) async {
    final httpService = new HttpService(context);
    try {
      final response = await httpService.sendUpdate(
          '$apiHost/classifieds/$classifiedId/toggle_like', {},
          module: "Clasificados");
      if (response != null && response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return null;
    }
  }
}
