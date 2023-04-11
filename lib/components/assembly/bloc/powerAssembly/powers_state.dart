part of 'powers_bloc.dart';

@immutable
class PowersState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<PowerAssemblyM>? powerAssemblies;

  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const PowersState({
    this.isInit = false,
    this.title = 'Poder',
    this.pagination,
    this.powerAssemblies,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  PowersState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<PowerAssemblyM>? powerAssemblies,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) =>
      PowersState(
        isInit: isInit ?? this.isInit,
        title: title ?? this.title,
        pagination: pagination ?? this.pagination,
        powerAssemblies: powerAssemblies ?? this.powerAssemblies,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        indexTab: indexTab ?? this.indexTab,
      );
}

class PowersInitial extends PowersState {}
