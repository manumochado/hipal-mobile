part of 'service_bloc.dart';

@immutable
class ServiceState {
  final bool dataLoaded;
  final bool isLoading;

  final Pagination? pagination;
  final List<Service>? services;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const ServiceState({
    this.dataLoaded = false,
    this.isLoading = false,
    this.pagination,
    this.services,
    this.page = 1,
    this.limit = 10,
    this.s = "",
  });

  ServiceState copyWith({
    bool? dataLoaded,
    bool? isLoading,
    Pagination? pagination,
    List<Service>? services,
    int? page,
    int? limit,
    String? s,
  }) => ServiceState(
    dataLoaded: dataLoaded ?? this.dataLoaded,
    isLoading: isLoading ?? this.isLoading,
    pagination: pagination ?? this.pagination,
    services: services ?? this.services,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
  );
}

class ServiceInitial extends ServiceState {}
