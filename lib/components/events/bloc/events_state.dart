part of 'events_bloc.dart';

@immutable
class EventsState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Events>? events;
  final String searchText;
  // Search Params
  final int page;
  final int limit;
  final String s;
  final String fromScreen;

  const EventsState({
    this.isInit = false,
    this.title = 'Eventos',
    this.searchText = '',
    this.pagination,
    this.events,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.fromScreen = "dashboard",
  });

  EventsState copyWith({
    bool? isInit,
    String? title,
    String? searchText,
    Pagination? pagination,
    List<Events>? events,
    Events? event,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
    String? fromScreen,
  }) => EventsState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    searchText: searchText ?? this.searchText,
    pagination: pagination ?? this.pagination,
    events: events ?? this.events,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    fromScreen: fromScreen ?? this.fromScreen,
  );
}

class EventsInitial extends EventsState {}
