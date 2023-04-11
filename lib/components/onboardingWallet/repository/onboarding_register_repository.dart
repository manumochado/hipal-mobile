import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';
import 'package:http/http.dart' as http;

class OnboardingRegisterRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getCity(BuildContext context) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendGet('$apiHost/ding/divipola/departments', module: "Onboarding");
    return response;
  }

  Future<dynamic> getMun(BuildContext context, String code) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet(
        '$apiHost/ding/divipola/departments/$code/municipalities',
        module: "Onboarding");
    return response;
  }

  Future<dynamic> sendOTPCode(BuildContext context, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.post(Uri.parse('$apiHost/ding-users/send-otp'),
          body: encodedData, headers: headers);
      return response;
    } finally {
      client.close();
    }
  }

  Future<dynamic> registerProfile(BuildContext context, params) async {
    var response;
    var headers = {"content-type": "application/json"};
    dynamic cookie = await storage.read(key: 'cookie');
    headers['cookie'] = cookie != null ? cookie.toString() : '';
    http.Client client = new http.Client();
    try {
      final String encodedData = json.encode(params);
      response = await client.post(Uri.parse('$apiHost/ding/wallet/client'),
          body: encodedData, headers: headers);
      return response;
    } finally {
      client.close();
    }
  }
}
