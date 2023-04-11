part of 'event_register_bloc.dart';

@immutable
class EventRegisterState {
  final bool isInit;

  final Pagination? pagination;
  final List<EventRegister>? eventsRegister;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const EventRegisterState({
    this.isInit = false,
    this.pagination,
    this.eventsRegister,
    this.page = 1,
    this.limit = -1,
    this.s = ""
  });

  EventRegisterState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<EventRegister>? eventsRegister,
    //EventRegister? eventRegister,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => EventRegisterState(
    isInit: isInit ?? this.isInit,
    pagination: pagination ?? this.pagination,
    eventsRegister: eventsRegister ?? this.eventsRegister,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
  );
}

class EventRegisterInitial extends EventRegisterState {}
