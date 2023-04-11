import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/directory/model/directory_emergency.dart';
import 'package:hipal/components/directory/model/directory_residential.dart';
import 'package:hipal/components/directory/repository/directory_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'directory_event.dart';
part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {

  final DirectoryRepository directoryRepo;

  params( String search, String page, String limit){
    return "?page="+page+"&limit="+state.limit.toString()+"&s="+search;
  }

  paramsResidential( String search, String page, String limit){
    return "?page="+page+"&limit="+state.limit.toString()+"&s="+search;
  }

  loadMore( response, emit){

    final lostObjectResponse = json.decode(response.body);
    final List<DirectoryEmergency> lostObjects = lostObjectResponse['data'].map((e) => DirectoryEmergency.fromJson(e)).toList().cast<DirectoryEmergency>();
    final Pagination? pagination = Pagination.fromJson(lostObjectResponse['page']);
    final newDirectoryEmergencies = [
      ...?state.listDirectoryEmergency,
      ...lostObjects,
    ];
    emit( state.copyWith(listDirectoryEmergency: newDirectoryEmergencies, pagination: pagination) );
  }

  loadMoreResidential( response, emit){

    final lostObjectResponse = json.decode(response.body);
    final List<DirectoryResidential> lostObjects = lostObjectResponse['data'].map((e) => DirectoryResidential.fromJson(e)).toList().cast<DirectoryResidential>();
    final Pagination? pagination = Pagination.fromJson(lostObjectResponse['page']);
    final newDirectoryResidential = [
      ...?state.listDirectoryResidential,
      ...lostObjects,
    ];
    emit( state.copyWith(listDirectoryResidential: newDirectoryResidential, paginationResidential: pagination) );
  }

  getDirectoryEmergencies(response, emit) {

    if( response!=null && response.statusCode == 200 ){
      final LostObjectsResponse = json.decode(response.body);
      final List<DirectoryEmergency> listDirectoryEmergency = LostObjectsResponse['data'].map((e) => DirectoryEmergency.fromJson(e)).toList().cast<DirectoryEmergency>();
      final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit( state.copyWith(listDirectoryEmergency: listDirectoryEmergency, pagination: pagination ) );
    }
  }

  getDirectoryResidential(response, emit) {

    if( response!=null && response.statusCode == 200 ){
      final directoryResidentialResponse = json.decode(response.body);
      final List<DirectoryResidential> listDirectoryResidential = directoryResidentialResponse['data'].map((e) => DirectoryResidential.fromJson(e)).toList().cast<DirectoryResidential>();
      final Pagination? pagination = Pagination.fromJson(directoryResidentialResponse['page']);
      print("");
      emit( state.copyWith(listDirectoryResidential: listDirectoryResidential, paginationResidential: pagination) );
    }
  }

  DirectoryBloc({required this.directoryRepo}) : super(DirectoryInitial()) {
    on<DirectoryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshDirectoryEmergency>((event, emit) async {
      emit( state.copyWith(page: 1, s: "" ) );
      final String params = this.params(state.s,state.page.toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryEmergency(event.context, params);
      getDirectoryEmergencies(response, emit);
    });

    on<searchDirectoryEmergency>((event, emit) async {
      emit( state.copyWith(page: 1, searchText: event.searchText ) );
      final String params = this.params(state.searchText,state.page.toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryEmergency(event.context, params);
      getDirectoryEmergencies(response, emit);
    });

    on<LoadMoreDirectoryEmergency>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      final String params = this.params("",(state.page).toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryEmergency(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshDirectoryResidential>((event, emit) async {
      emit( state.copyWith(pageResidential: 1, s: "" ) );
      final String params = this.paramsResidential(state.s,state.pageResidential.toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryResidential(event.context, params);
      getDirectoryResidential(response, emit);
    });

    on<LoadMoreDirectoryResidential>((event, emit) async {
      emit(state.copyWith(pageResidential: state.pageResidential+1 ));
      final String params = this.params("",(state.pageResidential).toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryResidential(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMoreResidential(response, emit);
    });

    on<searchDirectoryResidential>((event, emit) async {
      print("*/*/*/searchDirectoryResidential");
      emit( state.copyWith(pageResidential: 1, searchResidentialText: event.searchText ) );
      final String params = this.paramsResidential(state.searchResidentialText,state.page.toString(),state.limit.toString());
      final response = await this.directoryRepo.getDirectoryResidential(event.context, params);
      getDirectoryResidential(response, emit);
    });

    on<ChangeIndex>((event, emit) async {
      emit( state.copyWith( indexTab: event.index ) );
    });
  }
}
