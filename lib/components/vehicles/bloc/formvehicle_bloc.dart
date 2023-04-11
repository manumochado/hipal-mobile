import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

import 'package:hipal/components/vehicles/repository/vehicles_repository.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formvehicle_event.dart';
part 'formvehicle_state.dart';

class FormvehicleBloc extends Bloc<FormvehicleEvent, FormvehicleState> {
  final VehiclesRepository vehiclesRepo;

  Vehicle proccessData(String field, value){
    final Vehicle newVehicle;

    if(state.vehicle!=null){
      final Map<String,dynamic> objectVehicle = json.decode(json.encode(state.vehicle!.toJson()));
      objectVehicle[field] = value;
      newVehicle = Vehicle.fromJson(objectVehicle)!;
    }else{
      Map<String, dynamic> vehicle = { field: value };
      newVehicle = Vehicle.fromJson(vehicle)!;
    }

    return newVehicle;
  }

  FormvehicleBloc({required this.vehiclesRepo}) : super(FormvehicleInitial()) {
    on<LoadTypes>((event, emit) async {
      final String params = "?limit=-1";
      final response = await this.vehiclesRepo.getTypesVehicle(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final vehiclesResponse = json.decode(response.body);
        final List<TypeFilter> typeVehicles = vehiclesResponse['data'].map((e) => TypeFilter.fromJson(e)).toList().cast<TypeFilter>();

        emit( state.copyWith(typeVehicles: typeVehicles ) );
      }
    });

    on<ChangeType>((event, emit) async {
      emit( state.copyWith( typeName: event.typeName ) );
    });

    on<ChangeColor>((event, emit) async {
      final Vehicle newVehicle = this.proccessData( "color", event.color );
      emit( state.copyWith( vehicle: newVehicle ));
    });

    on<ChangePlate>((event, emit) async {
      final Vehicle newVehicle = this.proccessData( "plate", event.plate );
      emit( state.copyWith( vehicle: newVehicle ));
    });

    on<ChangeMark>((event, emit) async {
      final Vehicle newVehicle = this.proccessData( "mark", event.mark );
      emit( state.copyWith( vehicle: newVehicle ));
    });

    on<ChangeYear>((event, emit) async {
      final Vehicle newVehicle = this.proccessData( "year", event.year );
      emit( state.copyWith( vehicle: newVehicle ));
    });

    on<ChangeModel>((event, emit) async {
      final Vehicle newVehicle = this.proccessData( "model", event.model );
      emit( state.copyWith( vehicle: newVehicle ));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ResetForm>((event, emit) async {
      Vehicle newVehicle = Vehicle.fromJson({}) as Vehicle;
      print(newVehicle);
      emit( state.copyWith( image: '', typeName: '', vehicle: newVehicle, id: '' ));
    });

    on<EditVehicle>((event, emit) async {
      emit( state.copyWith( image: '', typeName: event.vehicle.type!.id, vehicle: event.vehicle, id: event.vehicle.id ));
    });

    on<ChangeLoading>((event, emit) async {
      emit( state.copyWith( isLoading: event.isLoading ));
    });

  }
}
