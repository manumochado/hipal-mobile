import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/events/model/event_register.dart';
import 'package:hipal/components/events/repository/event_register_repository.dart';
import 'package:meta/meta.dart';

import 'package:hipal/serializers/pagination.dart';

part 'event_register_event.dart';
part 'event_register_state.dart';

class EventRegisterBloc extends Bloc<EventRegisterEvent, EventRegisterState> {

  final EventRegisterRepository eventRegisterRepo;


  EventRegisterBloc({required this.eventRegisterRepo}) : super(EventRegisterInitial()) {
    on<EventRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshEventRegister>((event, emit) async {
      print("*****  EventRegisterBloc LoadRefreshEventRegister  *****");
      emit( state.copyWith(page: 1 ) );
      final String params = "?user=${event.eventId}" + "&limit="+state.limit.toString();
      final response = await this.eventRegisterRepo.getEventRegister(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final eventRegisterResponse = json.decode(response.body);
        final List<EventRegister> eventRegister = eventRegisterResponse['data'].map((e) => EventRegister.fromJson(e)).toList().cast<EventRegister>();
        final Pagination? pagination = Pagination.fromJson(eventRegisterResponse['page']);
        emit( state.copyWith(eventsRegister: eventRegister, pagination: pagination ) );
      }
    });

    on<LoadMoreEventRegister>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      final String params = "?user=${event.userId}" + "&limit="+state.limit.toString();
      final response = await this.eventRegisterRepo.getEventRegister(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final eventRegisterResponse = json.decode(response.body);
        final List<EventRegister> eventRegister = eventRegisterResponse['data'].map((e) => EventRegister.fromJson(e)).toList().cast<EventRegister>();
        final Pagination? pagination = Pagination.fromJson(eventRegisterResponse['page']);
        final newListEvents = [
          ...?state.eventsRegister,
          ...eventRegister,
        ];
        print("############################### tamaño ${newListEvents.length}");
        emit( state.copyWith(eventsRegister: newListEvents, pagination: pagination ) );
      }
    });

    on<CreateEventRegister>((event, emit) async {
      print("*****  EventRegisterBloc CreateEventRegister  *****");
      emit( state.copyWith(page: 1 ) );
      final params = {"event": event.eventId};
      final response = await this.eventRegisterRepo.postEventRegister(event.context, params);
      if( response!=null && (response.statusCode == 200 || response.statusCode == 201) ){
        print("+++++++++++++++++++++++++ Respondio");
        final eventRegisterResponse = EventRegister.fromJson(json.decode(response.body))!;
        final List<EventRegister>? newEventRegisters = [ eventRegisterResponse,...?state.eventsRegister, ];
        final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!+1).toInt() );
        emit( state.copyWith( eventsRegister: newEventRegisters, pagination: pagination ) );
      }
    });

    on<deleteEventRegister>((event, emit) async {
      print("***** Entro a DeleteEventRegister *****");
      final eventsRegisters = [...?state.eventsRegister, ];
      final List<EventRegister> newEventsRegisters = eventsRegisters.where((element) => element.id != event.id ).toList().cast<EventRegister>();
      final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!-1).toInt() );
      emit( state.copyWith( eventsRegister: newEventsRegisters, pagination: pagination ) );
      final response = await this.eventRegisterRepo.deleteEventRegister(event.context, event.id);
    });
  }
}
