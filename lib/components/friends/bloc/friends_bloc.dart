import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/friends/model/friends.dart';
import 'package:hipal/components/friends/repository/friends_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final FriendsRepository friendsRepo;

  params(String search, String page, String limit, String s) {
    return "?page=" +
        page +
        "&limit=" +
        state.limit.toString() +
        "&filters=user==" +
        search +
        ";nameilike" +
        s.toString();
  }

  getfriends(response, emit) {
    emit(state.copyWith(isLoading: true));
    if (response != null && response.statusCode == 200) {
      final LostObjectsResponse = json.decode(response.body);
      final List<Friends> listDirectoryEmergency = LostObjectsResponse['data']
          .map((e) => Friends.fromJson(e))
          .toList()
          .cast<Friends>();
      final Pagination? pagination =
          Pagination.fromJson(LostObjectsResponse['page']);
      emit(state.copyWith(
          listFriends: listDirectoryEmergency,
          pagination: pagination,
          isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  FriendsBloc({required this.friendsRepo}) : super(FriendsInitial()) {
    on<FriendsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeLoadingFriend>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });
    on<ChangeFormFriends>((event, emit) async {
      emit(state.copyWith(openForm: event.open));
    });

    on<LoadRefreshFriends>((event, emit) async {
      emit(state.copyWith(page: 1, searchText: "", isLoading: true));
      final String params = this.params(
          event.userID, state.page.toString(), state.limit.toString(), '');
      final response = await this.friendsRepo.getFriends(event.context, params);
      if (response != null) {
        emit(state.copyWith(isLoading: false));
        getfriends(response, emit);
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<searchFriends>((event, emit) async {
      emit(state.copyWith(page: 1, searchText: event.searchText));
      final String params = this.params(event.userID, state.page.toString(),
          state.limit.toString(), state.searchText);
      final response = await this.friendsRepo.getFriends(event.context, params);
      getfriends(response, emit);
    });

    on<LoadNewFriend>((event, emit) async {
      final newFriends = [
        event.friends,
        ...?state.listFriends,
      ];
      emit(state.copyWith(listFriends: newFriends, openForm: false));
    });

    on<DeleteFriend>((event, emit) async {
      final response =
          await this.friendsRepo.deleteFriend(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        final friends = [
          ...?state.listFriends,
        ];
        final List<Friends> newFriends = friends
            .where((element) => element.id != event.id)
            .toList()
            .cast<Friends>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(listFriends: newFriends, pagination: pagination));
      }
    });
  }
}
