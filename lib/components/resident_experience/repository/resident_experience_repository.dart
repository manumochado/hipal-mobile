import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class ResidentExperienceRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getResidentExperience(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/resident-experiences$params',
        module: 'Esperiencia del Residente');

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

   Future<dynamic> getResidentExperienceById(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/resident-experiences/${id}',
        module: 'Esperiencia del Residente');

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> getPqrTypes(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/type-pqrs?limit=1000&sort=name',
        module: 'Esperiencia del Residente');

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> getPqrCategories(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/type-category-pqrs?limit=1000&sort=name',
        module: 'Esperiencia del Residente');

    if (response != null && response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<dynamic> savePQR(BuildContext context, {required Map<String, dynamic> params}) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendPost('$apiHost/resident-experiences', params);

    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
       return response;
    }
    return null;
  }

  Future<dynamic> updatePQR(BuildContext context, {required String id, required Map<String, dynamic> params}) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendUpdate(
        '$apiHost/resident-experiences/$id', params);

    if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
      return response;
    } 

    return null;
  }

  Future<dynamic> deletePqr(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendDelete('$apiHost/resident-experiences/$id', {});

    if (response != null && response.statusCode == 200) {
      return response;
    }
    return null;
  }

  Future<dynamic> ratePQR(
      BuildContext context, {required String id, required params }) async {
    final httpService = new HttpService(context);

    final response = await httpService
        .sendUpdate('$apiHost/resident-experiences/${id}/score', params);

    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      return response;

    } 

    return null;
  }
}
