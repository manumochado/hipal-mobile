import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

import 'package:hipal/components/families/repository/families_repository.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formfamily_event.dart';
part 'formfamily_state.dart';

class FormfamilyBloc extends Bloc<FormfamilyEvent, FormfamilyState> {
  final FamiliesRepository familiesRepo;

  Family proccessData(String field, value){
    final Family newFamily;

    if(state.family!=null){
      final Map<String,dynamic> objectFamily = json.decode(json.encode(state.family!.toJson()));
      objectFamily[field] = value;
      newFamily = Family.fromJson(objectFamily)!;
    }else{
      Map<String, dynamic> family = { field: value };
      newFamily = Family.fromJson(family)!;
    }

    return newFamily;
  }

  FormfamilyBloc({required this.familiesRepo}) : super(FormfamilyInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this.familiesRepo.getTypesFamily(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final familiesResponse = json.decode(response.body);
        final List<TypeFilter> typeFamilies = familiesResponse['data'].map((e) => TypeFilter.fromJson(e)).toList().cast<TypeFilter>();

        emit( state.copyWith(typeFamilies: typeFamilies ) );
      }
    });

    on<ChangeType>((event, emit) async {
      emit( state.copyWith( typeName: event.typeName ) );
    });

    on<ChangeName>((event, emit) async {
      final Family newFamily = this.proccessData( "name", event.name );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangeEmail>((event, emit) async {
      final Family newFamily = this.proccessData( "email", event.email );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangePhone>((event, emit) async {
      final Family newFamily = this.proccessData( "phone", event.phone );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangeGender>((event, emit) async {
      final Family newFamily = this.proccessData( "gender", event.gender );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangeBirthDate>((event, emit) async {
      final Family newFamily = this.proccessData( "birthDate", event.birthDate );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangeIdentity>((event, emit) async {
      final Family newFamily = this.proccessData( "identity", event.identity );
      emit( state.copyWith( family: newFamily ));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ResetForm>((event, emit) async {
      Family newFamily = Family.fromJson({}) as Family;
      print(newFamily);
      emit( state.copyWith( image: '', typeName: '', family: newFamily, id: '' ));
    });

    on<EditFamily>((event, emit) async {
      emit( state.copyWith( image: '', typeName: event.family.type!.id, family: event.family, id: event.family.id ));
    });

    on<ChangeLoading>((event, emit) async {
      emit( state.copyWith( isLoading: event.isLoading ));
    });

  }
}
