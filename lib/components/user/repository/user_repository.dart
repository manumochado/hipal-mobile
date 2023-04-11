import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class UserRepository {
  final storage = new FlutterSecureStorage();
  final String apiHost = Environment().config.apiHost;
  final Map<String, String> headers = Environment().config.headers;

  Future<dynamic> getUser(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/myAccount');
    if (response != null && response.statusCode == 200) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      return decodedResp;
    } else {}
    return null;
  }

  Future<dynamic> editUser(BuildContext context, String id, params,
      Map<String, Object?> phone, String idPhone) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendUpdate('$apiHost/myAccount/update/$id', params);
    final responsePhone = await httpService.sendUpdate(
        '$apiHost/myAccount/update/Phone/$idPhone', phone);

    if (response != null && response.statusCode == 200) {
      return response;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(context, "Error al actualizar usuario");
    }
    return null;
  }

  Future<dynamic> editPhone(
      BuildContext context, String id, Map<String, Object> phone) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendUpdate('$apiHost/update/phone/$id', phone);

    if (response != null && response.statusCode == 200) {
      return response;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(context, "Error al actualizar telefono");
    }
    return null;
  }

  Future<dynamic> changePasswordUser(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response =
        await httpService.sendUpdate('$apiHost/users/change-password', params);

    if (response != null && response.statusCode == 200) {
      return response;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(context, "Error al actualizar la contraseña");
    }
    return null;
  }

  Future<dynamic> saveToken(BuildContext context, String token) async {
    late String platform = "";
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }

    final httpService = new HttpService(context);
    await httpService.sendPost(
        '$apiHost/token-users', {"token": token, "platform": platform});
  }
}
