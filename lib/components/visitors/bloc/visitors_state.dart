part of 'visitors_bloc.dart';

@immutable
class VisitorsState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Visit>? visitors;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const VisitorsState({
    this.isInit = false,
    this.title = 'Visitantes',
    this.pagination,
    this.visitors,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  VisitorsState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Visit>? visitors,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => VisitorsState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    visitors: visitors ?? this.visitors,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class VisitorsInitial extends VisitorsState {}
