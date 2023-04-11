part of 'profiles_bloc.dart';

@immutable
class ProfilesState {
  final bool isInitSocket;
  final int notView;

  final Pagination? pagination;
  final List<userChat.UserChat>? profiles;

  // Search Params
  final int page;
  final int limit;
  final String s;
  final String idTower;
  final bool isLoadingProfiles;

  const ProfilesState({
    this.idTower = '',
    this.isInitSocket = false,
    this.notView = 0,
    this.pagination,
    this.profiles,
    this.page = 0,
    this.limit = 10,
    this.s = "",
    this.isLoadingProfiles = false,
  });

  ProfilesState copyWith({
    String? idTower,
    bool? isInitSocket,
    int? notView,
    Pagination? pagination,
    List<userChat.UserChat>? profiles,
    int? page,
    int? limit,
    String? s,
    bool? isLoadingProfiles,
  }) =>
      ProfilesState(
        idTower: idTower ?? this.idTower,
        isInitSocket: isInitSocket ?? this.isInitSocket,
        notView: notView ?? this.notView,
        pagination: pagination ?? this.pagination,
        profiles: profiles ?? this.profiles,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        isLoadingProfiles: isLoadingProfiles ?? this.isLoadingProfiles,
      );
}

class ProfilesInitial extends ProfilesState {}
