import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/Management/advertisements/model/advertisements.dart';
import 'package:hipal/components/Management/advertisements/repository/advertisements_repository.dart';

part 'advertisements_event.dart';
part 'advertisements_state.dart';

class AdvertisementsBloc
    extends Bloc<AdvertisementsEvent, AdvertisementsState> {
  final AdvertisementsRepository advertisementsRepo;

  paramsAdvertisements( String search){
    return "?theme="+search;
  }

  loadMore( response, emit){
    final advertisementsResponse = json.decode(response.body);
    final List<Advertisements> advertisements = advertisementsResponse['data'].map((e) => Advertisements.fromJson(e)).toList().cast<Advertisements>();
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newAdvertisements = [
      ...?state.advertisements,
      ...advertisements,
    ];
    emit( state.copyWith(advertisements: newAdvertisements) );
  }

  getDirectoryEmergencies(response, emit) {

    if( response!=null && response.statusCode == 200 ){
      final LostObjectsResponse = json.decode(response.body);
      final List<Advertisements> listDirectoryEmergency = LostObjectsResponse['data'].map((e) => Advertisements.fromJson(e)).toList().cast<Advertisements>();
      //final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit( state.copyWith(advertisements: listDirectoryEmergency ) );
    }
  }

  AdvertisementsBloc({required this.advertisementsRepo})
      : super(AdvertisementsInitial()) {
    on<LoadAdvertisements>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response = await this.advertisementsRepo.getAdvertisements(event.context);
  
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshAdvertisements>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
     // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response = await this.advertisementsRepo.getAdvertisements(event.context);
      if( response!=null && response.statusCode == 200 ){
        final advertisementsResponse = json.decode(response.body);
        final List<Advertisements> advertisements = advertisementsResponse['data'].map((e) => Advertisements.fromJson(e)).toList().cast<Advertisements>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit( state.copyWith(advertisements: advertisements) );
      }
    });
   on<searchAdvertisements>((event, emit) async {
      print("*/*/*/searchDirectoryResidential");
      emit( state.copyWith(searchResidentialText: event.searchText ) );
      final String params = this.paramsAdvertisements(state.searchResidentialText);
      final response = await this.advertisementsRepo.getAdvertisementsShears(event.context, params);
      getDirectoryEmergencies(response, emit);
    });
    
  }
}
