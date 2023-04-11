import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

import 'package:hipal/components/pets/repository/pets_repository.dart';
import 'package:hipal/components/pets/model/pet.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formpet_event.dart';
part 'formpet_state.dart';

class FormpetBloc extends Bloc<FormpetEvent, FormpetState> {
  final PetsRepository petsRepo;

  Pet proccessData(String field, value){
    final Pet newPet;

    if(state.pet!=null){
      final Map<String,dynamic> objectPet = json.decode(json.encode(state.pet!.toJson()));
      objectPet[field] = value;
      newPet = Pet.fromJson(objectPet)!;
    }else{
      Map<String, dynamic> pet = { field: value };
      newPet = Pet.fromJson(pet)!;
    }

    return newPet;
  }

  FormpetBloc({required this.petsRepo}) : super(FormpetInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this.petsRepo.getTypesPet(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final petsResponse = json.decode(response.body);
        final List<TypeFilter> typePets = petsResponse['data'].map((e) => TypeFilter.fromJson(e)).toList().cast<TypeFilter>();

        emit( state.copyWith(typePets: typePets ) );
      }
    });

    on<ChangeType>((event, emit) async {
      emit( state.copyWith( typeName: event.typeName ) );
    });

    on<ChangeName>((event, emit) async {
      final Pet newPet = this.proccessData( "name", event.name );
      emit( state.copyWith( pet: newPet ));
    });

    on<ChangeRace>((event, emit) async {
      final Pet newPet = this.proccessData( "race", event.race );
      emit( state.copyWith( pet: newPet ));
    });

    on<ChangeColor>((event, emit) async {
      final Pet newPet = this.proccessData( "color", event.color );
      emit( state.copyWith( pet: newPet ));
    });

     on<ChangeDate>((event, emit) async {
      print(event.birthDate);
      final Pet newPet = this.proccessData( "birthDate", event.birthDate );
      emit( state.copyWith( pet: newPet ));
    });

    on<ChangeVaccinated>((event, emit) async {
      final Pet newPet = this.proccessData( "vaccinated", event.vaccinated );
      emit( state.copyWith( pet: newPet ));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ResetForm>((event, emit) async {
      Pet newPet = Pet.fromJson({}) as Pet;
      emit( state.copyWith( image: '', typeName: '', pet: newPet, id: '' ));
    });

    on<EditPet>((event, emit) async {
      emit( state.copyWith( image: '', typeName: event.pet.type!.id, pet: event.pet, id: event.pet.id ));
    });

    on<ChangeLoading>((event, emit) async {
      emit( state.copyWith( isLoading: event.isLoading ));
    });

  }
}
