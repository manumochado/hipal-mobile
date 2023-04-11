import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/auth/login/ui/login_view.dart';
import 'package:hipal/components/auth/recovery/ui/recovery_view.dart';
import 'package:hipal/components/dashboard/ui/dashboard.dart';
import 'package:hipal/services/notification_service.dart';
import 'package:hipal/widgets/dialog.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final BuildContext context;
  final storage = new FlutterSecureStorage();
  final String errorInternet =
      'No te encuentras conectado a internet o Tu conexión a internet es inestable';
  final String errorTimeExecute = 'Tu conexión a internet es inestable.';
  final String errorGeneral =
      'Ha ocurrido un error inesperado, por favor inténtalo más tarde';
  // Map<String, String> headers = Environment().config.headers;
  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
  };
  Map<String, String> cookies = {};

  int notAuthorizedCode = 403;
  int internalServerError = 500;

  HttpService(this.context);

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      storage.write(key: 'cookie', value: headers['cookie']);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie
          .split('=')
          .where((element) => element.isNotEmpty)
          .toList(growable: false);
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;
        this.cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.length > 0) cookie += ";";

      cookie += '$key=' + cookies[key].toString();
    }

    return cookie;
  }

  Future<http.Response?> sendGet(String endpoint,
      {int? time, String? module}) async {
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';

    try {
      http.Response response = await http
          .get(Uri.parse(endpoint), headers: headers)
          .timeout(Duration(seconds: (time != null) ? time : 20));
      if (response.statusCode == notAuthorizedCode) {
        await this.errorManager(
            context, "No tienes el permiso para consultar ${module ?? ''}");
      }
      if (response.statusCode == internalServerError) {
        await this.errorManager(
            context, "Se produjo un error que no pudimos controlar.");
      }
      _updateCookie(response);
      return response;
    } on SocketException {
      await this.errorManager(context, errorInternet);
    } on TimeoutException catch (_) {
      await this.errorManager(context, errorTimeExecute);
    } catch (_) {
      await this.errorManager(context, errorGeneral);
    }

    return null;
  }

  Future<http.Response?> sendPost(String endpoint, dynamic params,
      {int? time, String? module}) async {
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    //try {
      http.Response response = await http
          .post(
            Uri.parse(endpoint),
            headers: headers,
            body: params,
          )
          .timeout(Duration(seconds: (time != null) ? time : 30));

      if (response.statusCode == notAuthorizedCode) {
        await this.errorManager(
            context, "No tienes el permiso para crear ${module ?? ''}");
      }

      _updateCookie(response);

      return response;
    //} on SocketException catch (_) {
      await this.errorManager(context, errorInternet);
    //} on TimeoutException catch (_) {
    //  await this.errorManager(context, errorTimeExecute);
    //} catch (e) {
      
     // await this.errorManager(context, errorGeneral);
    //}
    //return null;
  }

  Future<http.Response?> sendUpdate(String endpoint, dynamic params,
      {int? time, String? module, bool contentJson = false}) async {
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    if (contentJson) {
      headers['Content-Type'] = "application/json";
    }

    try {
      http.Response response = await http
          .put(
            Uri.parse(endpoint),
            headers: headers,
            body: params,
          )
          .timeout(Duration(seconds: (time != null) ? time : 30));

      if (response.statusCode == notAuthorizedCode) {
        await this.errorManager(
            context, "No tienes el permiso para actualizar ${module ?? ''}");
      }

      return response;
    } on SocketException {
      await this.errorManager(context, errorInternet);
    } on TimeoutException catch (_) {
      await this.errorManager(context, errorTimeExecute);
    } catch (error) {
      await this.errorManager(context, errorGeneral);
    }

    return null;
  }

  Future<http.Response?> sendDelete(String endpoint, dynamic params,
      {int? time, String? module}) async {
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';

    try {
      http.Response response = await http
          .delete(
            Uri.parse(endpoint),
            headers: headers,
            body: params,
          )
          .timeout(Duration(seconds: (time != null) ? time : 30));

      if (response.statusCode == notAuthorizedCode) {
        await this.errorManager(
            context, "No tienes el permiso para eliminar ${module ?? ''}");
      }

      return response;
    } on SocketException {
      await this.errorManager(context, errorInternet);
    } on TimeoutException catch (_) {
      await this.errorManager(context, errorTimeExecute);
    } catch (_) {
      await this.errorManager(context, errorGeneral);
    }

    return null;
  }

  Future logout() async {
    await storage.delete(key: 'cookie');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'cookie') ?? '';
  }

  Future<void> errorManager(BuildContext context, String message) async {
    Map<String, dynamic> params = {
      "title": "Error",
      "message": message,
      "color": 0xff8176FB
    };

    Map<String, dynamic> notRedirectModules = {
      "recovery-password": RecoveryPasswordScreen(),
      "login": LoginScreen(),
      "logout": LoginScreen(),
      "dashboard": DashboardScreen()
    };

    SingletonStatusDialog statusDialog = SingletonStatusDialog();

    try {
      if (statusDialog.statusDialog == "Cerrado") {
        await NotificationService.showDialogHeipal(
            context, json.encode(params));
      }
      statusDialog.open();
    } catch (e) {
    } finally {
      String? currentRoute = ModalRoute.of(context)!.settings.name;
      if (!notRedirectModules.containsKey(currentRoute)) {
        Navigator.pushNamed(context, "dashboard");
      }
      statusDialog.close();
    }
  }
}
