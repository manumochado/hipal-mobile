part of 'address_deliveries_bloc.dart';

@immutable
class AddressDeliveriesState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<AddressDelivery>? addressDeliveries;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String type;
  final String nameSearch;

  const AddressDeliveriesState({
    this.isInit = false,
    this.title = 'AddresDomicilios',
    this.pagination,
    this.addressDeliveries,
    this.page = 1,
    this.limit = 10,
    this.type = "",
    this.nameSearch = "",
    this.indexTab = 0,
  });

  AddressDeliveriesState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<AddressDelivery>? addressDeliveries,
    int? page,
    int? limit,
    String? type,
    String? nameSearch,
    int? indexTab,
  }) => AddressDeliveriesState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    addressDeliveries: addressDeliveries ?? this.addressDeliveries,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    type: type ?? this.type,
    nameSearch: nameSearch ?? this.nameSearch,
    indexTab: indexTab ?? this.indexTab,
  );
}

class AddressDeliveriesInitial extends AddressDeliveriesState {}
