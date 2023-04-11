import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/lostObjects/model/lost_object.dart';
import 'package:hipal/components/lostObjects/repository/lost_objects_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'lost_object_event.dart';
part 'lost_object_state.dart';

class LostObjectBloc extends Bloc<LostObjectEvent, LostObjectState> {

  final LostObjectsRepository lostObjectsRepo;

  params( String search, String page, String limit, String  searchText){
    return "?page="+page+"&limit="+state.limit.toString()+"&nameObject="+searchText;
  }
  LostObject proccessEditLostObject( lostObject, compareLostObject ){
    if(lostObject.id == compareLostObject.id)
      return compareLostObject;
    return lostObject;
  }

  loadMore( response, emit){

    final lostObjectResponse = json.decode(response.body);
    final List<LostObject> lostObjects = lostObjectResponse['data'].map((e) => LostObject.fromJson(e)).toList().cast<LostObject>();
    final Pagination? pagination = Pagination.fromJson(lostObjectResponse['page']);
    final newLostObjects = [
      ...?state.lostObjects,
      ...lostObjects,
    ];
    emit( state.copyWith(lostObjects: newLostObjects, pagination: pagination) );
  }

  getLostObjects(response, emit) {

    if( response!=null && response.statusCode == 200 ){
      final LostObjectsResponse = json.decode(response.body);
      final List<LostObject> lostObjects = LostObjectsResponse['data'].map((e) => LostObject.fromJson(e)).toList().cast<LostObject>();
      final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit( state.copyWith(lostObjects: lostObjects, pagination: pagination ) );
    }
  }

  LostObjectBloc({required this.lostObjectsRepo}) : super(LostObjectInitial()) {
    on<LostObjectEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshLostObject>((event, emit) async {
      emit( state.copyWith(page: 1, searchText: "" ) );
      final String params = this.params(state.s,state.page.toString(),state.limit.toString(),state.searchText);
      final response = await this.lostObjectsRepo.getLostObjects(event.context, params);
      getLostObjects(response, emit);
    });

    on<searchLostObject>((event, emit) async {
      emit( state.copyWith(page: 1, searchText: event.searchText ) );
      final String params = this.params(state.s,state.page.toString(),state.limit.toString(),state.searchText);
      final response = await this.lostObjectsRepo.getLostObjects(event.context, params);
      getLostObjects(response, emit);
    });

    on<EditLostObject>((event, emit) async {
      final responseEdit = await this.lostObjectsRepo.editLostObject(event.context,event.lockerId,event.state);
      LostObject? lostObject = LostObject.fromJson(json.decode(responseEdit.body));
      final lockers = [...?state.lostObjects, ];
      final List<LostObject> newnewLockers= lockers.map((lockerItem) => proccessEditLostObject(lockerItem,lostObject) ).toList().cast();
      emit( state.copyWith(lostObjects: newnewLockers ));
    });

    on<LoadMoreLostObject>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      final String params = this.params(state.s,(state.page).toString(),state.limit.toString(),"");
      final response = await this.lostObjectsRepo.getLostObjects(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });
  }

}
