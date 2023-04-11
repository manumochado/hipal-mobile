import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/notifications/notification.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/widgets/dialog.dart';

class LoginRepository {
  final storage = new FlutterSecureStorage();
  final String apiHost = Environment().config.apiHost;
  final Map<String, String> headers = Environment().config.headers;

  Future<dynamic> login(BuildContext context, String email, String password,
      String? profile) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/auth/login', {
      'email': email,
      'password': password,
      'type': 'mobile',
      'profile': profile != null ? profile : '',
    });

    if (response?.statusCode == 200) {
      final Map<String, dynamic> decodedResp = json.decode(response!.body);
      /*
      if (decodedResp["status"] == 'loggedin') {
        final firebaseMessaging = FCM();
        final token = await firebaseMessaging.getToken();
        late String platform = "";
        if (Platform.isAndroid) {
          platform = "Android";
        } else if (Platform.isIOS) {
          platform = "IOS";
        }
        //TODO: Revisar la funcionalidad del siguiente código
        final httpService = new HttpService(context);
        final response2 = await httpService.sendPost(
            '$apiHost/token-users', {"token": token, "platform": platform});
      }
      */

      return decodedResp;
    } else if (response?.statusCode == 400) {
      final Map<String, dynamic> decodedResp = json.decode(response!.body);

      if (decodedResp["error"] == "UserDisabled") {
        httpService.errorManager(context, decodedResp["message"]);
      } else {
        httpService.errorManager(
            context, "El usuario o contraseña no son correctos");
      }
    } else {
      httpService.errorManager(
          context, "No fue posible iniciar sesión, intente nuevamente.");
    }
    return null;
  }

  Future<dynamic> logout(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/auth/logout', {});

    if (response != null && response.statusCode == 200) {
      await storage.delete(key: 'statusLogged');
      await storage.delete(key: 'userLogged');
      await storage.delete(key: 'cookie');

      // Delete Token
      final firebaseMessaging = FCM();
      final token = await firebaseMessaging.getToken();
      firebaseMessaging.dispose();
      final httpService = new HttpService(context);
      await httpService.sendDelete('$apiHost/token-users/$token', {});

      return true;
    } else if (response?.statusCode == 400) {
      httpService.errorManager(context, "Error al cerrar sesión");
    }
    return null;
  }

  errorManage(BuildContext context, int statusCode, String message) {
    Map<String, dynamic> params = {
      "title": "Error",
      "message": "Ha ocurrido un error",
    };

    if (statusCode == 404) {
      params["message"] = 'No se ha podido conectar al servidor';
    }

    if (statusCode == 400) {
      params["message"] = message;
    }

    Navigator.of(context).restorablePush(DialogHipal.dialogBuilder,
        arguments: json.encode(params));
  }
}
