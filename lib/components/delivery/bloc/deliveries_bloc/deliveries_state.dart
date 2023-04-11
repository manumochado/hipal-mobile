part of 'deliveries_bloc.dart';

@immutable
class DeliveriesState {
  final bool isInit;
  final String idPressed;
  final String title;
  final Pagination? pagination;
  final List<Delivery>? deliveries;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;

  const DeliveriesState({
    this.isInit = false,
    this.idPressed = '',
    this.title = 'Domicilios',
    this.pagination,
    this.deliveries,
    this.page = 1,
    this.limit = 10,
    this.indexTab = 0,
  });

  DeliveriesState copyWith({
    bool? isInit,
    String? idPressed,
    String? title,
    Pagination? pagination,
    List<Delivery>? deliveries,
    int? page,
    int? limit,
    int? indexTab,
  }) => DeliveriesState(
    isInit: isInit ?? this.isInit,
    idPressed: idPressed ?? this.idPressed,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    deliveries: deliveries ?? this.deliveries,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    indexTab: indexTab ?? this.indexTab,
  );
}

class DeliveriesInitial extends DeliveriesState {}
