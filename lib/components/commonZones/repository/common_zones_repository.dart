import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';
import 'package:http/http.dart' as http;

class CommonZonesRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getTypeZones(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/common-zones?page=1&limit=30&filters=enabled==true',
        module: "Tipos de Zonas");
    return response;
  }

  Future<dynamic> getScheduleForId(BuildContext context, id, date) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/reservation/${id}/${date}', module: "Reservaciones");
    return response;
  }

  Future<dynamic> getReservations(BuildContext context, id_user, params) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/reservations/me$params', module: "Reservaciones");
    return response;
  }

  Future<dynamic> getCommonZonesForId(BuildContext context, String id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/common-zones/${id}',
        module: "Zonas Comunes");
    return response;
  }

  Future<dynamic> getFriends(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/users$params', module: "Amigos");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getCommonZonesForIdDate(
      BuildContext context, String id, String date) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/common-zones/$id?enabled_hours_by_date=$date',
        module: "Zonas Comunes");
    return response;
  }

  Future<dynamic> deleteReservation(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete(
        '$apiHost/reservations/me/$id', {},
        module: "Reservaciones");
    return response;
  }

  Future<dynamic> saveReservation(BuildContext context, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.post(Uri.parse('$apiHost/reservations/me'),
          body: encodedData, headers: headers);
      return response;
    } finally {
      client.close();
    }
  }

  Future<dynamic> editReservation(
      BuildContext context, String id, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.put(
          Uri.parse('$apiHost/reservations/me/$id'), //your address here
          body: encodedData,
          headers: headers);
      return response;
    } finally {
      client.close();
    }
  }
}
