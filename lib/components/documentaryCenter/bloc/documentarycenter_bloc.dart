import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/documentaryCenter/model/documentaryCenter.dart';
import 'package:hipal/components/documentaryCenter/repository/documentaryCenter_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'documentarycenter_event.dart';
part 'documentarycenter_state.dart';

class DocumentarycenterBloc extends Bloc<DocumentarycenterEvent, DocumentarycenterState> {

  final DocumentaryCenterRepository documentaryCenterRepo;

  params( String page, String limit){
    return "?page="+page+"&limit="+state.limit.toString();
  }

  DocumentarycenterBloc({required this.documentaryCenterRepo}) : super(DocumentarycenterInitial()) {
    on<DocumentarycenterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetDocuments>((event, emit) async {
      print("*********  Get Documents  **********");
      emit( state.copyWith(page: 1 ) );
      String params = this.params(state.page.toString(),state.limit.toString());
      final response = await this.documentaryCenterRepo.getDocuments(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final documentaryCenterResponse = json.decode(response.body);
        final List<DocumentaryCenter> documents = documentaryCenterResponse['data'].map((e) => DocumentaryCenter.fromJson(e)).toList().cast<DocumentaryCenter>();
        final Pagination? pagination = Pagination.fromJson(documentaryCenterResponse['page']);
        emit( state.copyWith(documents: documents, pagination: pagination));
      }
    });

    on<LoadMoreDocumentCategory>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      String params = this.params(state.page.toString(),state.limit.toString());
      final response = await this.documentaryCenterRepo.getDocuments(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final documentaryCenterResponse = json.decode(response.body);
        final List<DocumentaryCenter> documents = documentaryCenterResponse['data'].map((e) => DocumentaryCenter.fromJson(e)).toList().cast<DocumentaryCenter>();
        final Pagination? pagination = Pagination.fromJson(documentaryCenterResponse['page']);
        final newDocuments = [
          ...?state.documents,
          ...documents,
        ];
        emit( state.copyWith(documents: newDocuments, pagination: pagination));
      }
    });

    on<GetDocumentForId>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );

      final response = await this.documentaryCenterRepo.getDocumentForId(event.context, event.id);
      if( response!=null && response.statusCode == 200 ){
        final documentaryCenterResponse = json.decode(response.body);
        print('************************documentaryCenter con ID *********************');
        final List<DocumentaryCenter> documents = documentaryCenterResponse['data'].map((e) => DocumentaryCenter.fromJson(e)).toList().cast<DocumentaryCenter>();
        final Pagination? pagination = Pagination.fromJson(documentaryCenterResponse['page']);
        emit( state.copyWith(documents: documents, pagination: pagination) );
      }
    });

    on<searchCategory>((event, emit) async {
      print("*/*/*/searchEvent ${event.searchText}");
      emit( state.copyWith(page: 1, searchText: event.searchText ) );
      final String params = this.params(state.searchText,state.limit.toString());
      final response = await this.documentaryCenterRepo.searchCategories(event.context, event.searchText);
      if( response !=null && response.statusCode == 200 ){
        print("Ok searchEvent 200");
        final documentaryCenterResponse = json.decode(response.body);
        final List<DocumentaryCenter> documents = documentaryCenterResponse['data'].map((e) => DocumentaryCenter.fromJson(e)).toList().cast<DocumentaryCenter>();
        final Pagination? pagination = Pagination.fromJson(documentaryCenterResponse['page']);
        emit( state.copyWith(documents: documents, pagination: pagination));
      }
    });
  }
}
