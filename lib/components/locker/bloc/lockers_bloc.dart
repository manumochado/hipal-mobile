import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/locker/model/locker.dart';
import 'package:hipal/components/locker/repository/locker_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'lockers_event.dart';
part 'lockers_state.dart';

class LockersBloc extends Bloc<LockersEvent, LockersState> {
  final LockerRepository lockerRepo;

  params(String stated, String limit, String page) {
    return "?state=" +
        stated +
        "&limit=" +
        state.limit.toString() +
        "&page=" +
        page;
  }

  Locker proccessLocker(locker, comparelocker) {
    if (locker.id == comparelocker.id) return comparelocker;
    return locker;
  }

  loadMore(response, event, emit, bool refresh) {
    print("LoadMore");
    final lockersResponse = json.decode(response.body);

    final List<Locker> lockers = lockersResponse['data']
        .map((e) => Locker.fromJson(e))
        .toList()
        .cast<Locker>();

    if (event.state == "Pendiente") {
      final Pagination? pagination =
          Pagination.fromJson(lockersResponse['page']);
      final newLockersPending = refresh
          ? lockers
          : [
              ...?state.lockersPending,
              ...lockers,
            ];
      emit(state.copyWith(
          lockersPending: newLockersPending,
          paginationPending: pagination,
          pending: lockersResponse['statistic']['pending']));
    } else if (event.state == "Entregado") {
      final Pagination? pagination =
          Pagination.fromJson(lockersResponse['page']);
      final newlockersDelivered = refresh
          ? lockers
          : [
              ...?state.lockersDelivered,
              ...lockers,
            ];
      emit(state.copyWith(
          lockersDelivered: newlockersDelivered,
          paginationDelivered: pagination));
    } else if (event.state == "Devuelto") {
      final Pagination? pagination =
          Pagination.fromJson(lockersResponse['page']);
      final lockersReturned = refresh
          ? lockers
          : [
              ...?state.lockersReturned,
              ...lockers,
            ];
      emit(state.copyWith(
          lockersReturned: lockersReturned, paginationReturned: pagination));
    }
  }

  LockersBloc({required this.lockerRepo}) : super(LockersInitial()) {
    on<LockersEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshLocker>((event, emit) async {
      String params = "";
      if (event.state == "Pendiente") {
        emit(state.copyWith(pagePending: 1));
        params = this.params(
            event.state, state.limit.toString(), state.pagePending.toString());
      } else if (event.state == "Entregado") {
        emit(state.copyWith(pageDelivered: 1));
        params = this.params(event.state, state.limit.toString(),
            state.pageDelivered.toString());
      } else if (event.state == "Devuelto") {
        emit(state.copyWith(pageReturned: 1));
        params = this.params(
            event.state, state.limit.toString(), state.pageReturned.toString());
      }
      final response = await this.lockerRepo.getlockers(event.context, params);
      if (response != null && response.statusCode == 200) {
        this.loadMore(response, event, emit, true);
      }
    });

    on<EditLocker>((event, emit) async {

      final responseEdit = await this
          .lockerRepo
          .editLocker(event.context, event.lockerId, event.state);
      final lockersPending = [
        ...?state.lockersPending,
      ];
      Locker? locker = Locker.fromJson(json.decode(responseEdit.body));

      final List<Locker> newLockersPending = lockersPending
          .where((element) => element.id != locker!.id)
          .toList()
          .cast<Locker>();

      final Pagination? paginationPending = state.paginationPending!
          .rebuild((b) => b..total = (b.total! - 1).toInt());

      if (locker!.state == "Entregado") {
        final lockersDelivered = [
          locker,
          ...?state.lockersDelivered,
        ];
        final Pagination? paginationDelivered = state.paginationDelivered!
            .rebuild((b) => b..total = (b.total! + 1).toInt());
        emit(state.copyWith(
            lockersDelivered: lockersDelivered,
            paginationDelivered: paginationDelivered,
            lockersPending: newLockersPending,
            paginationPending: paginationPending,
            pending: state.pending-1));
      } else if (locker.state == "Devuelto") {
        final lockersReturned = [
          locker,
          ...?state.lockersReturned,
        ];
        final Pagination? paginationReturned = state.paginationReturned!
            .rebuild((b) => b..total = (b.total! + 1).toInt());
        emit(state.copyWith(
            lockersReturned: lockersReturned,
            paginationDelivered: paginationReturned,
            lockersPending: newLockersPending,
            paginationPending: paginationPending,
            pending: state.pending-1));
      }
    });

    on<LoadMoreLocker>((event, emit) async {
      String params = "";
      if (event.state == "Pendiente") {
        emit(state.copyWith(pagePending: state.pagePending + 1));
        params = this.params(
            event.state, state.limit.toString(), state.pagePending.toString());
      } else if (event.state == "Entregado") {
        emit(state.copyWith(pageDelivered: state.pageDelivered + 1));
        params = this.params(event.state, state.limit.toString(),
            state.pageDelivered.toString());
      } else if (event.state == "Devuelto") {
        emit(state.copyWith(pageReturned: state.pageReturned + 1));
        params = this.params(
            event.state, state.limit.toString(), state.pageReturned.toString());
      }
      final response = await this.lockerRepo.getlockers(event.context, params);

      if (response != null && response.statusCode == 200) print("si consiguio");
      this.loadMore(response, event, emit, false);
    });

    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
