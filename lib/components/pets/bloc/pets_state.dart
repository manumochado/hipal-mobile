part of 'pets_bloc.dart';

@immutable
class PetsState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Pet>? pets;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const PetsState({
    this.isInit = false,
    this.title = 'Mis Mascotas',
    this.pagination,
    this.pets,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  PetsState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Pet>? pets,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => PetsState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    pets: pets ?? this.pets,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class PetsInitial extends PetsState {}
