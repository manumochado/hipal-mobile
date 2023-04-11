import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:hipal/components/delivery/repository/deliveries_repository.dart';
import 'package:hipal/serializers/pagination.dart';

part 'deliveries_event.dart';
part 'deliveries_state.dart';

class DeliveriesBloc extends Bloc<DeliveriesEvent, DeliveriesState> {
  final DeliveriesRepository deliveriesRepo;

  params(String page) {
    return "?page=" + page + "&limit=" + state.limit.toString();
  }

  loadMore(response, emit) {
    final deliveriesResponse = json.decode(response.body);
    print(deliveriesResponse);
    final List<Delivery> deliveries = deliveriesResponse['data']
        .map((e) => Delivery.fromJson(e))
        .toList()
        .cast<Delivery>();
    final Pagination? pagination =
        Pagination.fromJson(deliveriesResponse['page']);
    final newDeliveries = [
      ...?state.deliveries,
      ...deliveries,
    ];
    emit(state.copyWith(deliveries: newDeliveries, pagination: pagination));
  }

  Delivery proccessDelivery(delivery, compareDelivery) {
    if (delivery.id == compareDelivery.delivery.id)
      return compareDelivery.delivery;
    return delivery;
  }

  DeliveriesBloc({required this.deliveriesRepo}) : super(DeliveriesInitial()) {
    on<LoadDeliveries>((event, emit) async {
      final String params = this.params(state.page.toString());

      final response =
          await this.deliveriesRepo.getDeliveries(event.context, params);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<LoadRefreshDeliveries>((event, emit) async {
      print("++++++++++++ DeliveriesBloc LoadRefreshDeliveries");
      emit(state.copyWith(page: 1));
      final String params = this.params(state.page.toString());
      final response =
          await this.deliveriesRepo.getDeliveries(event.context, params);
      if (response != null && response.statusCode == 200) {
        final deliveriesResponse = json.decode(response.body);
        final List<Delivery> deliveries = deliveriesResponse['data']
            .map((e) => Delivery.fromJson(e))
            .toList()
            .cast<Delivery>();
        final Pagination? pagination =
            Pagination.fromJson(deliveriesResponse['page']);
        emit(state.copyWith(deliveries: deliveries, pagination: pagination));
      }
    });

    on<LoadMoreDeliveries>((event, emit) async {
      print("++++++++++++ DeliveriesBloc LoadMoreDeliveries");
      emit(state.copyWith(page: state.page + 1));
      final String params = this.params(state.page.toString());
      final response =
          await this.deliveriesRepo.getDeliveries(event.context, params);
      if (response != null && response.statusCode == 200) {
        this.loadMore(response, emit);
      }
    });

    on<LoadNewDelivery>((event, emit) async {
      print(event.delivery);
      final newDeliveries = [
        event.delivery,
        ...?state.deliveries,
      ];
      final Pagination? pagination =
          state.pagination!.rebuild((b) => b..total = (b.total! + 1).toInt());
      emit(state.copyWith(deliveries: newDeliveries, pagination: pagination));
    });

    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
