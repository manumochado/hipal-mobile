part of 'lockers_bloc.dart';

@immutable
class LockersState {
  final bool isInit;

  final String title;
  final Pagination? paginationDelivered;
  final Pagination? paginationPending;
  final Pagination? paginationReturned;
  final List<Locker>? lockersDelivered;
  final List<Locker>? lockersPending;
  final List<Locker>? lockersReturned;

  final int? indexTab;

  // Search Params
  final int pageDelivered;
  final int pagePending;
  final int pageReturned;
  final int limit;
  final int pending;
  final int delivered;
  final int returned;
  final String s;

  const LockersState(
      {this.isInit = false,
      this.title = 'Casillero',
      this.paginationDelivered,
      this.paginationPending,
      this.paginationReturned,
      this.lockersDelivered,
      this.lockersPending,
      this.lockersReturned,
      this.pageDelivered = 1,
      this.pagePending = 1,
      this.pageReturned = 1,
      this.pending = 0,
      this.delivered = 0,
      this.returned = 0,
      this.limit = 10,
      this.s = "",
      this.indexTab = 0});

  LockersState copyWith({
    bool? isInit,
    String? title,
    Pagination? paginationDelivered,
    Pagination? paginationPending,
    Pagination? paginationReturned,
    List<Locker>? lockersDelivered,
    List<Locker>? lockersPending,
    List<Locker>? lockersReturned,
    Locker? locker,
    int? pageDelivered,
    int? pagePending,
    int? pageReturned,
    int? pending,
    int? delivered,
    int? returned,
    int? limit,
    String? s,
    int? indexTab,
  }) =>
      LockersState(
        isInit: isInit ?? this.isInit,
        title: title ?? this.title,
        paginationDelivered: paginationDelivered ?? this.paginationDelivered,
        paginationPending: paginationPending ?? this.paginationPending,
        paginationReturned: paginationReturned ?? this.paginationReturned,
        lockersDelivered: lockersDelivered ?? this.lockersDelivered,
        lockersPending: lockersPending ?? this.lockersPending,
        lockersReturned: lockersReturned ?? this.lockersReturned,
        pageDelivered: pageDelivered ?? this.pageDelivered,
        pagePending: pagePending ?? this.pagePending,
        pageReturned: pageReturned ?? this.pageReturned,
        pending: pending ?? this.pending,
        delivered: delivered ?? this.delivered,
        returned: returned ?? this.returned,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        indexTab: indexTab ?? this.indexTab,
      );
}

class LockersInitial extends LockersState {}
