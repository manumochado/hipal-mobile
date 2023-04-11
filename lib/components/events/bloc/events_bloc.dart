import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/components/events/repository/events_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {

  final EventsRepository eventsRepo;

  params( String search){
    return "?name="+search+"&limit="+state.limit.toString()+"&page="+state.page.toString();
  }

  Events proccessEvents( events, compareevents ){
    if(events.id == compareevents.id)
      print("------------- Encontrado");
      return compareevents;
    return events;
  }

  Events proccessChangeData(String field, value, Events event){
    final Events newEvent;

      final Map<String,dynamic> objectEvent = json.decode(json.encode(event.toJson()));
    objectEvent[field] = value;
      newEvent = Events.fromJson(objectEvent)!;

    return newEvent;
  }


  EventsBloc({required this.eventsRepo}) : super(EventsInitial()) {
    on<EventsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshEvents>((event, emit) async {
      print("*****  EventsBloc LoadRefreshEvents  *****");
      emit( state.copyWith(page: 1 ) );
      final String params = this.params(state.s);

      final response = await this.eventsRepo.getEvents(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final eventsResponse = json.decode(response.body);
        final List<Events> events = eventsResponse['data'].map((e) => Events.fromJson(e)).toList().cast<Events>();
        final Pagination? pagination = Pagination.fromJson(eventsResponse['page']);
        emit( state.copyWith(events: events, pagination: pagination));
      }
    });

    on<LoadMoreEvents>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      final String params = this.params(state.s);
      final response = await this.eventsRepo.getEvents(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final eventsResponse = json.decode(response.body);
        final List<Events> newsEvents = eventsResponse['data'].map((e) => Events.fromJson(e)).toList().cast<Events>();
        final Pagination? pagination = Pagination.fromJson(eventsResponse['page']);
        final newListEvents = [
          ...?state.events,
          ...newsEvents,
        ];
        emit( state.copyWith(events: newListEvents, pagination: pagination));
      }
    });

    on<searchEvent>((event, emit) async {
      print("*/*/*/searchEvent ${event.searchText}");
      emit( state.copyWith(page: 1, searchText: event.searchText ) );
      final String params = this.params(state.searchText);
      final response = await this.eventsRepo.getEvents(event.context, params);
      if( response !=null && response.statusCode == 200 ){
        print("Ok searchEvent 200");
        final eventsResponse = json.decode(response.body);
        final List<Events> events = eventsResponse['data'].map((e) => Events.fromJson(e)).toList().cast<Events>();
        final Pagination? pagination = Pagination.fromJson(eventsResponse['page']);
        emit( state.copyWith(events: events, pagination: pagination));
      }
    });

    on<favoriteEvent>((event, emit) async {
      print("*/*/*/favoriteEvent ${event.value}");
      final response = await this.eventsRepo.setFavoriteEvent(event.context, event.id, event.value);
      if( response !=null && response.statusCode == 200 ){
        Events eventResponse = Events.fromJson(json.decode(response.body)) as Events;
        final events = [...?state.events, ];
        final List<Events> newEvents= events.map((event) => proccessEvents(event,eventResponse) ).toList().cast();
        emit( state.copyWith(events: newEvents) );
      }
    });

    on<ChangeFromScreen>((event, emit) async {
        emit( state.copyWith(fromScreen: event.screen) );
    });

    on<ChangeStateEvent>((event, emit) async {
      print("############### Cambiando el valor");
      final Events newEvent = proccessChangeData("stated", event.stated, event.event);
      print(newEvent);
      print("####################################");
      final events = [...?state.events, ];
      final List<Events> newEvents= events.map((event) => proccessEvents(event,newEvent) ).toList().cast();
      emit( state.copyWith(events: newEvents) );
    });

  }
}
