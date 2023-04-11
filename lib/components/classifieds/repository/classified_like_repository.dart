import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';

class ClassifiedsLikeRepository{
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();



  Future<dynamic> getClassifiedTotalLikes(BuildContext context, String id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/likes?classified=${id}');

    if( response!=null && response.statusCode == 200 ){
    }
    return response;
  }

  Future<dynamic> getLikeUserToClassified(BuildContext context, String id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/likes/${id}');

    if( response!=null && response.statusCode == 200 ){
    }
    return response;
  }


  Future<dynamic> saveLikeClassified(BuildContext context, params) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendPost('$apiHost/likes', params);
    if( response!=null && response.statusCode == 200 ){
    }else{
    }
    return response;
  }


  Future<dynamic> deleteClassifiedLike(BuildContext context, id) async {
    final httpService = new HttpService(context);

    final response = await httpService.sendDelete('$apiHost/likes/$id', {});

    if( response!=null && response.statusCode == 200 ){
    }else{
    }
    return response;
  }

}