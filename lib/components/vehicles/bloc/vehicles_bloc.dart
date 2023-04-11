import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';

import 'package:hipal/components/vehicles/repository/vehicles_repository.dart';

part 'vehicles_event.dart';
part 'vehicles_state.dart';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  final VehiclesRepository vehiclesRepo;

  params( String search, String page, String limit, String startId ){
    return "?s="+state.s+"&page="+page+"&limit="+state.limit.toString()+"&startId="+startId;
  }

  loadMore( response, emit){
    final vehiclesResponse = json.decode(response.body);
    print(vehiclesResponse);
    final List<Vehicle> vehicles = vehiclesResponse['data'].map((e) => Vehicle.fromJson(e)).toList().cast<Vehicle>();
    final Pagination? pagination = Pagination.fromJson(vehiclesResponse['page']);
    final newVehicles = [
      ...?state.vehicles,
      ...vehicles,
    ];
    emit( state.copyWith(vehicles: newVehicles, pagination: pagination) );
  }

  Vehicle proccessVehicle( vehicle, compareVehicle ){
    if(vehicle.id == compareVehicle.vehicle.id)
      return compareVehicle.vehicle;
    return vehicle;
  }

  VehiclesBloc({required this.vehiclesRepo}) : super(VehiclesInitial()) {
    on<LoadVehicles>((event, emit) async {
      final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');

      final response = await this.vehiclesRepo.getVehicles(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshVehicles>((event, emit) async {
      emit( state.copyWith(page: 1 ) );
      final String params = this.params(state.s,"1",state.limit.toString(), '');

      final response = await this.vehiclesRepo.getVehicles(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final vehiclesResponse = json.decode(response.body);
        final List<Vehicle> vehicles = vehiclesResponse['data'].map((e) => Vehicle.fromJson(e)).toList().cast<Vehicle>();
        final Pagination? pagination = Pagination.fromJson(vehiclesResponse['page']);
        emit( state.copyWith(vehicles: vehicles, pagination: pagination) );
      }
    });

    on<LoadMoreVehicles>((event, emit) async {
      final String params = this.params(state.s,"",state.limit.toString(), state.vehicles!.last.id.toString());

      final response = await this.vehiclesRepo.getVehicles(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<DeleteVehicle>((event, emit) async {
      final response = await this.vehiclesRepo.deleteVehicle(event.context, event.id);
      print(response.statusCode);
      if( response!=null && response.statusCode == 200 ){
        final vehicles = [...?state.vehicles, ];
        final List<Vehicle> newVehicles = vehicles.where((element) => element.id != event.id ).toList().cast<Vehicle>();

        final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!-1).toInt() );
        emit( state.copyWith( vehicles: newVehicles, pagination: pagination ) );
      }
    });

    on<LoadNewVehicle>((event, emit) async {
      print(event.vehicle);
      final newVehicles = [ event.vehicle,...?state.vehicles, ];
      final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!+1).toInt() );
      emit( state.copyWith( vehicles: newVehicles, pagination: pagination ) );
    });

    on<LoadEditVehicle>((event, emit) async {
      final vehicles = [...?state.vehicles, ];
      final List<Vehicle> newVehicles = vehicles.map((vehicle) => proccessVehicle(vehicle,event) ).toList().cast();      
      emit( state.copyWith(vehicles: newVehicles) );
    });

    on<ChangeIndex>((event, emit) async {
      emit( state.copyWith( indexTab: event.index ) );
    });
  }
}
