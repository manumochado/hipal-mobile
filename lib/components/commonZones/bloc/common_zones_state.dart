part of 'common_zones_bloc.dart';

@immutable
class CommonZonesState {
  final bool isInit;
  final String title;
  final List<Common.TypeZone>? typeZones;
  final List<Common.TypeZone>? commonZone;
  final Common.TypeZone? selectedZone;
  final List<Reservations>? reservations;
  final List<TypeFilter>? typeCommonZone;
  final List<Friends>? listFriends;
  final String? typeName;
  final Reservations? reservation;
  final bool isLoading;
  final bool isEditing;
  final Pagination? pagination;
  final int page;
  final int limit;
  final String selectedDate;
  final String cost;
  final String start;
  final String end;
  final List<Friends>? guest;

  const CommonZonesState({
    this.guest,
    this.isInit = false,
    this.selectedDate = '',
    this.cost = '0',
    this.start = '',
    this.end = '',
    this.title = 'Zonas Comunes',
    this.typeCommonZone,
    this.selectedZone,
    this.commonZone,
    this.typeName,
    this.listFriends,
    this.typeZones,
    this.reservations,
    this.reservation,
    this.isLoading = false,
    this.isEditing = false,
    this.pagination,
    this.page = 1,
    this.limit = 10,
  });

  CommonZonesState copyWith({
    List<Friends>? guest,
    bool? isInit,
    String? selectedDate,
    String? cost,
    String? title,
    String? start,
    String? end,
    String? typeName,
    List<TypeFilter>? typeCommonZone,
    List<Common.TypeZone>? typeZones,
    Common.TypeZone? selectedZone,
    List<Reservations>? reservations,
    List<Friends>? listFriends,
    Reservations? reservation,
    bool? isLoading,
    bool? isEditing,
    Pagination? pagination,
    List<Common.TypeZone>? commonZone,
    int? page,
    int? limit,
  }) =>
      CommonZonesState(
        guest: guest ?? this.guest,
        isInit: isInit ?? this.isInit,
        title: title ?? this.title,
        start: start ?? this.start,
        end: end ?? this.end,
        selectedDate: selectedDate ?? this.selectedDate,
        cost: cost ?? this.cost,
        typeName: typeName ?? this.typeName,
        typeCommonZone: typeCommonZone ?? this.typeCommonZone,
        typeZones: typeZones ?? this.typeZones,
        commonZone: commonZone ?? this.commonZone,
        selectedZone: selectedZone ?? this.selectedZone,
        listFriends: listFriends ?? this.listFriends,
        reservations: reservations ?? this.reservations,
        reservation: reservation ?? this.reservation,
        isLoading: isLoading ?? this.isLoading,
        isEditing: isEditing ?? this.isEditing,
        pagination: pagination ?? this.pagination,
        page: page ?? this.page,
        limit: limit ?? this.limit,
      );

  String nameType(String id) {
    if (this.typeCommonZone != null) {
      for (var item in this.typeCommonZone!) {
        if (item.id == id) return item.name.toString();
      }
    }
    return '';
  }
}

class CommonZonesInitial extends CommonZonesState {}
