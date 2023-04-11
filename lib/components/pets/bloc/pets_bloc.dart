import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/components/pets/model/pet.dart';

import 'package:hipal/components/pets/repository/pets_repository.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  final PetsRepository petsRepo;

  params( String search, String page, String limit, String startId ){
    return "?s="+state.s+"&page="+page+"&limit="+state.limit.toString()+"&startId="+startId;
  }

  loadMore( response, emit){
    final petsResponse = json.decode(response.body);
    final List<Pet> pets = petsResponse['data'].map((e) => Pet.fromJson(e)).toList().cast<Pet>();
    final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newPets = [
      ...?state.pets,
      ...pets,
    ];
    emit( state.copyWith(pets: newPets, pagination: pagination) );
  }

  Pet proccessPet( pet, comparePet ){
    if(pet.id == comparePet.pet.id)
      return comparePet.pet;
    return pet;
  }

  PetsBloc({required this.petsRepo}) : super(PetsInitial()) {
    on<LoadPets>((event, emit) async {
      final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response = await this.petsRepo.getPets(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshPets>((event, emit) async {
      emit( state.copyWith(page: 1 ) );
      final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response = await this.petsRepo.getPets(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final petsResponse = json.decode(response.body);
        final List<Pet> pets = petsResponse['data'].map((e) => Pet.fromJson(e)).toList().cast<Pet>();
        final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit( state.copyWith(pets: pets, pagination: pagination) );
      }
    });

    on<LoadMorePets>((event, emit) async {
      final String params = this.params(state.s,"",state.limit.toString(), state.pets!.last.id.toString());
      final response = await this.petsRepo.getPets(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<DeletePet>((event, emit) async {
      final response = await this.petsRepo.deletePet(event.context, event.id);
      if( response!=null && response.statusCode == 200 ){
        final pets = [...?state.pets, ];
        final List<Pet> newPets = pets.where((element) => element.id != event.id ).toList().cast<Pet>();
        final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!-1).toInt() );
        emit( state.copyWith( pets: newPets, pagination: pagination ) );
      }
    });

    on<LoadNewPet>((event, emit) async {
      final newPets = [ event.pet,...?state.pets, ];
      final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!+1).toInt() );
      emit( state.copyWith( pets: newPets, pagination: pagination ) );
    });

    on<LoadEditPet>((event, emit) async {
      final pets = [...?state.pets, ];
      final List<Pet> newPets = pets.map((pet) => proccessPet(pet,event) ).toList().cast();      
      emit( state.copyWith(pets: newPets) );
    });

    on<ChangeIndex>((event, emit) async {
      emit( state.copyWith( indexTab: event.index ) );
    });
  }
}
