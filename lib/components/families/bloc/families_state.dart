part of 'families_bloc.dart';

@immutable
class FamiliesState {
  final bool isInit;
  final bool isLoading;

  final String title;
  final Pagination? pagination;
  final List<Family>? families;

  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const FamiliesState({
    this.isInit = false,
    this.isLoading = false,
    this.title = 'Familiares',
    this.pagination,
    this.families,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  FamiliesState copyWith({
    bool? isInit,
    bool? isLoading,
    String? title,
    Pagination? pagination,
    List<Family>? families,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) =>
      FamiliesState(
        isLoading: isLoading ?? this.isLoading,
        isInit: isInit ?? this.isInit,
        title: title ?? this.title,
        pagination: pagination ?? this.pagination,
        families: families ?? this.families,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        indexTab: indexTab ?? this.indexTab,
      );
}

class FamiliesInitial extends FamiliesState {}
