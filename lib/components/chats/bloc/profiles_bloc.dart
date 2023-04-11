import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/chats/repository/profiles_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/serializers/profile.dart';
import 'package:meta/meta.dart';

import '../model/UserProfile.dart' as userChat;

part 'profiles_event.dart';
part 'profiles_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final ProfilesRepository profilesRepo;
  params(String search, String skip, String limit, String tower_id) {
    return "?skip=" +
        skip +
        "&limit=" +
        state.limit.toString() +
        "&s=" +
        search +
        "&tower_id=" +
        tower_id.toString();
  }

  loadMore(response, emit) {
    final profilesResponse = json.decode(response.body);
    final List<userChat.UserChat> profiles = profilesResponse['data']
        .map((e) => userChat.UserChat.fromJson(e))
        .toList()
        .cast<userChat.UserChat>();
    final Pagination? pagination =
        Pagination.fromJson(profilesResponse['page']);
    final newProfiles = [
      ...?state.profiles,
      ...profiles,
    ];
    emit(state.copyWith(profiles: newProfiles, pagination: pagination));
  }

  Profile proccessProfile(profile, compareProfile) {
    if (profile.id == compareProfile.profile.id) return compareProfile.profile;
    return profile;
  }

  ProfilesBloc({required this.profilesRepo}) : super(ProfilesInitial()) {
    on<ProfilesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadProfiles>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingProfiles: true));

        final String params = this.params(state.s,
            state.profiles!.length.toString(), state.limit.toString(), '');
        final response =
            await this.profilesRepo.getProfiles(event.context, params);
        if (response != null && response.statusCode == 200)
          this.loadMore(response, emit);
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingProfiles: false));
      }
    });

    on<InitProfile>((event, emit) async {
      this.profilesRepo.changeContext(event.context);
      this.profilesRepo.initProfile(event.context, state.isInitSocket);
      emit(state.copyWith(isInitSocket: true));
    });

    on<LoadRefreshProfiles>((event, emit) async {
      try {
        emit(state.copyWith(page: 1, isLoadingProfiles: true));
        final String params =
            this.params(state.s, "0", state.limit.toString(), state.idTower);
        final response =
            await this.profilesRepo.getProfiles(event.context, params);
        if (response != null && response.statusCode == 200) {
          final profilesResponse = json.decode(response.body);
          final List<userChat.UserChat> profiles = profilesResponse['data']
              .map((e) => userChat.UserChat.fromJson(e))
              .toList()
              .cast<userChat.UserChat>();
          final Pagination? pagination =
              Pagination.fromJson(profilesResponse['page']);
          emit(state.copyWith(profiles: profiles, pagination: pagination));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingProfiles: false));
      }
    });

    on<ResetProfilesSearch>((event, emit) async {
      emit(state.copyWith(s: ''));
    });
    on<ChangeSearchProfile>((event, emit) async {
      emit(state.copyWith(s: event.search, idTower: event.tower));
    });
  }
}
