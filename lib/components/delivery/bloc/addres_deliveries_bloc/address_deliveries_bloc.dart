import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/delivery/model/addressDelivery.dart';
import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:hipal/components/delivery/repository/address_deliveries_repository.dart';
import 'package:hipal/components/delivery/repository/deliveries_repository.dart';
import 'package:hipal/serializers/pagination.dart';

part 'address_deliveries_event.dart';
part 'address_deliveries_state.dart';

// deliveries
// Deliveries
class AddressDeliveriesBloc extends Bloc<AdddressDeliveriesEvent, AddressDeliveriesState> {
  final AddreesDeliveriesRepository addresDeliveriesRepo;

  params(String search, String page, String limit) {
    return "?type=" + state.type + "&name=" + search + "&page=" + page + "&limit=" + state.limit.toString();
  }

  loadMore(response, emit) {
    final addresDeliveriesResponse = json.decode(response.body);
    final List<AddressDelivery> addressDeliveries =
        addresDeliveriesResponse['data']
            .map((e) => AddressDelivery.fromJson(e))
            .toList()
            .cast<AddressDelivery>();
    final Pagination? pagination =
        Pagination.fromJson(addresDeliveriesResponse['page']);
    final newAddressDeliveries = [
      ...?state.addressDeliveries,
      ...addressDeliveries,
    ];
    emit(state.copyWith(
        addressDeliveries: newAddressDeliveries, pagination: pagination));
  }

  AddressDelivery proccessDelivery(addressDelivery, compareAddressDelivery) {
    if (addressDelivery.id == compareAddressDelivery.delivery.id)
      return compareAddressDelivery.delivery;
    return addressDelivery;
  }

  AddressDeliveriesBloc({required this.addresDeliveriesRepo}): super(AddressDeliveriesInitial()) {

    on<LoadAddressDeliveries>((event, emit) async {
      print("++++++++++++++ AddressDeliveriesBloc LoadAddressDeliveries");
      final String params = this.params(state.nameSearch, state.page.toString(), state.limit.toString());

      final response = await this.addresDeliveriesRepo.getAddressDeliveries(event.context, params);
          print('____________response_____________');
          print(response);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<LoadAddressRefreshDeliveries>((event, emit) async {
      print("++++++++++++++ AddressDeliveriesBloc LoadAddressRefreshDeliveries");
      emit(state.copyWith(page: 1, type: event.typeDelivery, nameSearch: ""));
      final String params = this.params("", state.page.toString(), state.limit.toString());
      final response = await this.addresDeliveriesRepo.getAddressDeliveries(event.context, params);
      if (response != null && response.statusCode == 200) {
        final addressDeliveriesResponse = json.decode(response.body);
        final List<AddressDelivery> addressDeliveries = addressDeliveriesResponse['data'].map((e) => AddressDelivery.fromJson(e)).toList().cast<AddressDelivery>();
        final Pagination? pagination = Pagination.fromJson(addressDeliveriesResponse['page']);
        emit(state.copyWith(addressDeliveries: addressDeliveries, pagination: pagination));
      }
    });

    on<searchAddressDirectory>((event, emit) async {
      print("++++++++++++++ AddressDeliveriesBloc searchAddressDirectory");
      emit( state.copyWith(page: 1, nameSearch: event.searchText ) );
      final String params = this.params(state.nameSearch,state.page.toString(),state.limit.toString());
      final response = await this.addresDeliveriesRepo.getAddressDeliveries(event.context, params);
      if (response != null && response.statusCode == 200) {
        final addressDeliveriesResponse = json.decode(response.body);
        final List<AddressDelivery> addressDeliveries = addressDeliveriesResponse['data'].map((e) => AddressDelivery.fromJson(e)).toList().cast<AddressDelivery>();
        final Pagination? pagination = Pagination.fromJson(addressDeliveriesResponse['page']);
        emit(state.copyWith(addressDeliveries: addressDeliveries, pagination: pagination));
      }
    });

    on<LoadMoreAddressDeliveries>((event, emit) async {
      print("++++++++++++++ AddressDeliveriesBloc LoadMoreAddressDeliveries");
      emit(state.copyWith(page: state.page+1 ));
      final String params = this.params(state.nameSearch, state.page.toString(), state.limit.toString());
      final response = await this.addresDeliveriesRepo.getAddressDeliveries(event.context, params);
      if (response != null && response.statusCode == 200){
        print("++++++++++++++ ${response}");
        this.loadMore(response, emit);
      }
    });

    on<LoadNewAddressDelivery>((event, emit) async {
      print(event.addressDelivery);
      final newAddressDeliveries = [
        event.addressDelivery,
        ...?state.addressDeliveries,
      ];
      final Pagination? pagination =
          state.pagination!.rebuild((b) => b..total = (b.total! + 1).toInt());
      emit(state.copyWith(
          addressDeliveries: newAddressDeliveries, pagination: pagination));
    });

    on<LoadEditAddressDelivery>((event, emit) async {
      final addressDeliveries = [
        ...?state.addressDeliveries,
      ];
      final List<AddressDelivery> newDeliveries = addressDeliveries
          .map((addressDelivery) => proccessDelivery(addressDelivery, event))
          .toList()
          .cast();
      emit(state.copyWith(addressDeliveries: newDeliveries));
    });

    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
