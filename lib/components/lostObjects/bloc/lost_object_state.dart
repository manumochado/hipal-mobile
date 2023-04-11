part of 'lost_object_bloc.dart';

@immutable
class LostObjectState {

  final String title;
  final String searchText;
  final Pagination? pagination;
  final List<LostObject>? lostObjects;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const LostObjectState({
    this.title = 'Objetos Perdidos',
    this.searchText = '',
    this.pagination,
    this.lostObjects,
    this.page = 1,
    this.limit = 10,
    this.s = "",
  });

  LostObjectState copyWith({
    String? title,
    String? searchText,
    Pagination? pagination,
    List<LostObject>? lostObjects,
    int? page,
    int? limit,
    String? s,
  }) => LostObjectState(
    title: title ?? this.title,
    searchText: searchText ?? this.searchText,
    pagination: pagination ?? this.pagination,
    lostObjects: lostObjects ?? this.lostObjects,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
  );
}

class LostObjectInitial extends LostObjectState {}
