
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:hipal/services/http.dart';
import 'package:hipal/environment/environment.dart';


class ClassifiedCommentRepository {
  final String apiHost = Environment().config.apiHost;
  final storage = new FlutterSecureStorage();

  Future<dynamic> getClassifiedComment(BuildContext context, String idClassified, String params) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendGet('$apiHost/classifieds-comments/by-classified/$idClassified$params');
    if( response!=null && response.statusCode == 200 ){
    }else if( response?.statusCode == 400 ){
      httpService.errorManager(context, "Error al traer la lista de comentarios de clasificados");
    }



    return response;
  }

  Future<dynamic> saveComment(BuildContext context, params) async {
    final httpService = new HttpService(context);

    
    try{
      final response = await httpService.sendPost('$apiHost/classifieds-comments', params);

      if( response!=null && response.statusCode == 200 ){
      }else if( response?.statusCode == 400 ){
        httpService.errorManager(context, "Error al guardar el comentario");
      }
      return response;
    }catch(e){
      httpService.errorManager(context, "Error al guardar el comentario");
    }
  }

  //classifieds-comments/6359c02e514712ea28a9685d/toggle_like

  Future<dynamic> deleteComment(BuildContext context, id) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendDelete('$apiHost/comment-classified/${id}',"");

    if( response!=null && response.statusCode == 200 ){
    }else{
    }

    return response;
  }

  Future<bool> tougleLike(BuildContext context, String commentId) async {
    final httpService = new HttpService(context);
    final response = await httpService.sendUpdate('$apiHost/classifieds-comments/$commentId/toggle_like',"");

    if( response!=null && response.statusCode == 200 ){
      return true;
    }

    return false;
  }

}