part of 'vehicles_bloc.dart';

@immutable
class VehiclesState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Vehicle>? vehicles;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const VehiclesState({
    this.isInit = false,
    this.title = 'Vehículos',
    this.pagination,
    this.vehicles,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  VehiclesState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Vehicle>? vehicles,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => VehiclesState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    vehicles: vehicles ?? this.vehicles,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class VehiclesInitial extends VehiclesState {}
