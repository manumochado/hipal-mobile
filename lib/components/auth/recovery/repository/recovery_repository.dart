import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/widgets/dialog.dart';

class RecoveryRepository {
  final storage = new FlutterSecureStorage();
  final String apiHost = Environment().config.apiHost;
  final Map<String, String> headers = Environment().config.headers;

  Future<dynamic> recoveryAccount(
      BuildContext context, String emailOrPhone) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendPost('$apiHost/auth/search-email-phone', {
      'emailOrPhone': emailOrPhone,
    });

    if (response != null) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      //TODO: Verificar los status codes que retorna el api 200?.
      if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
        this.errorManager(context, response.statusCode,
            'No se ha encontrado ningún usuario con estos datos');
        return null;
      }
      return decodedResp;
    }
    return null;
  }

  Future<dynamic> sendCode(
      BuildContext context, String emailOrPhone, String type) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/auth/send-code', {
      'emailOrPhone': emailOrPhone,
      'type': type,
    });

    if (response != null) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
        this.errorManager(
            context, response.statusCode, 'No se ha podido enviar el código');
        return null;
      }
      return decodedResp;
    }

    return null;
  }

  Future<dynamic> validateCode(
      BuildContext context, String emailOrPhone, String code) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/auth/validate-code', {
      'emailOrPhone': emailOrPhone,
      'code': code,
    });

    if (response != null) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
        String message = '';
        if (decodedResp["error"] == 'CodeNotValid') {
          message = "El código no es correcto";
        } else if (decodedResp["error"] == 'CodeExpired') {
          message = "El código ha expirado, por favor envía uno de nuevo";
        } else {
          message = "Ha ocurrido un error";
        }

        this.errorManager(context, response.statusCode, message);
        return null;
      }

      return decodedResp;
    }

    return null;
  }

  Future<dynamic> changePassword(BuildContext context, String emailOrPhone,
      String code, String password) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendPost('$apiHost/auth/change-password', {
      'emailOrPhone': emailOrPhone,
      'code': code,
      'password': password,
    });

    if (response != null) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);

      if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
        String message = '';
        if (decodedResp["error"] == 'CodeNotValid') {
          message = "El código no es correcto";
        } else if (decodedResp["error"] == 'CodeExpired') {
          message = "El código ha expirado, por favor envía uno de nuevo";
        } else {
          message =
              "No se ha podido restablecer la contraseña, intentalo más tarde.";
        }

        this.errorManager(context, response.statusCode, message);
        return null;
      }

      return decodedResp;
    }
    return null;
  }

  errorManager(BuildContext context, int statusCode, String message) {
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
