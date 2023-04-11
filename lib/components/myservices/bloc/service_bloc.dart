import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:hipal/components/myservices/model/service.dart';
import 'package:meta/meta.dart';

import '../../../serializers/pagination.dart';
import '../repository/service_repository.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {

  final ServiceRepository serviceRepo;

  params( String search, String limit ){
    return "?s="+state.s+"&limit="+state.limit.toString();
  }

  Service proccessService( service, compareService ){
    if(service.id == compareService.id)
      return compareService;
    return service;
  }

  ServiceBloc({required this.serviceRepo}) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetDataLoadedService>((event, emit) {
      emit( state.copyWith(dataLoaded: event.loaded) );
    });

    on<LoadRefreshService>((event, emit) async {
      print("*****  ServiceBloc LoadRefreshService  *****");
      emit( state.copyWith(page: 1 ) );
      final String params = this.params(state.s,state.limit.toString());

      final response = await this.serviceRepo.getService(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        print("----------------- Emitira el estado en LoadRefreshService");
        final lockersResponse = json.decode(response.body);
        final List<Service> services = lockersResponse['data'].map((e) => Service.fromJson(e)).toList().cast<Service>();
        final Pagination? pagination = Pagination.fromJson(lockersResponse['page']);
        emit( state.copyWith(services: services, pagination: pagination, dataLoaded: true) );
      }
    });

    on<EditService>((event, emit) async {
      print("*****  ServiceBloc EditService   *****");
      final services = [...?state.services, ];
      final List<Service> newServices= services.map((serviceItem) => proccessService(serviceItem,event) ).toList().cast();
      emit( state.copyWith(services: newServices, isLoading: false ));
    });

    on<ChangeLoading>((event, emit) async {
      emit( state.copyWith( isLoading: event.isLoading ));
    });

    on<LoadNewService>((event, emit) async {
      print("*****  ServiceBloc LoadNewService *****");
      print(event.service);
      final newServices = [ event.service,...?state.services, ];
      emit( state.copyWith( services: newServices ) );
    });

    on<LoadEditService>((event, emit) async {
      print("*****  ServiceBloc LoadEditService *****");
      final services = [...?state.services, ];
      final List<Service> newServices= services.map((service) => proccessService(service,event) ).toList().cast();
      emit( state.copyWith(services: newServices) );
    });

    on<DeleteService>((event, emit) async {
      print("*****  PetsBloc DeletePet line 74 *****");
      final response = await this.serviceRepo.deleteService(event.context, event.id);
      if( response!=null && response.statusCode == 200 ){
        final services = [...?state.services, ];
        final List<Service> newServices = services.where((element) => element.id != event.id ).toList().cast<Service>();

        emit( state.copyWith( services: newServices) );
      }
    });
  }
}
