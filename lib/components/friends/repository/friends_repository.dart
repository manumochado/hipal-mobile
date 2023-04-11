import 'package:flutter/material.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/services/http.dart';

class FriendsRepository {
  final String apiHost = Environment().config.apiHost;

  Future<dynamic> getFriends(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/friends/$params', module: "Amigos");

    if (response != null && response.statusCode == 200) {}

    return response;
  }

  Future<dynamic> getFriendsFromId(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response =
        await httpService.sendGet('$apiHost/friends/$id', module: "Amigos");
    return response;
  }

  Future<dynamic> saveFriend(BuildContext context, params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendPost('$apiHost/friends/me', params,
        module: "Amigos");
    return response;
  }

  Future<dynamic> editFriend(BuildContext context, String id, params) async {
    final httpService = new HttpService(context);
    final response = await httpService
        .sendUpdate('$apiHost/friends/$id', params, module: "Amigos");
    return response;
  }

  Future<dynamic> deleteFriend(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete('$apiHost/friends/me/$id', {},
        module: "Amigos");
    return response;
  }
}
