import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/chats/repository/chats_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

import '../model/ChatResponse.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsRepository chatsRepo;

  params(String search, String skip, String limit, String startId) {
    return "?s=" +
        state.s +
        "&skip=" +
        skip +
        "&limit=" +
        state.limit.toString() +
        "&startId=" +
        startId;
  }

  loadMore(response, emit) {
    final chatsResponse = json.decode(response.body);
    final List<ChatResponse> chats = chatsResponse['data']
        .map((e) => chatsResponse.fromJson(e))
        .toList()
        .cast<ChatResponse>();
    final Pagination? pagination = Pagination.fromJson(chatsResponse['page']);
    final newChats = [
      ...?state.chats,
      ...chats,
    ];
    emit(state.copyWith(chats: newChats, pagination: pagination));
  }

  ChatResponse proccessChat(chat, compareChat) {
    if (chat.id == compareChat.chat.id) return compareChat.chat;
    return chat;
  }

  ChatsBloc({required this.chatsRepo}) : super(ChatsInitial()) {
    on<LoadChats>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingMore: true));
        final String params = this.params(state.s,
            state.chats!.length.toString(), state.limit.toString(), '');
        final response = await this.chatsRepo.getChats(event.context, params);
        if (response != null && response.statusCode == 200)
          this.loadMore(response, emit);
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingMore: false));
      }
    });

    on<InitChat>((event, emit) async {
      this.chatsRepo.changeContext(event.context);
      this.chatsRepo.initChat(event.context, state.isInitSocket);
      emit(state.copyWith(isInitSocket: true));
    });

    on<ChangeSearchValue>((event, emit) {
      emit(state.copyWith(s: event.search));
    });

    on<LoadRefreshChats>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingRefresh: true));
        emit(state.copyWith(page: 1));
        final String params =
            this.params(state.s, "0", state.limit.toString(), '');
        final response = await this.chatsRepo.getChats(event.context, params);
        if (response != null && response.statusCode == 200) {
          final chatsResponse = json.decode(response.body);
          final List<ChatResponse> chats = chatsResponse['data']
              .map((e) => ChatResponse.fromJson(e))
              .toList()
              .cast<ChatResponse>();
          final Pagination? pagination =
              Pagination.fromJson(chatsResponse['page']);
          emit(state.copyWith(chats: chats, pagination: pagination));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingRefresh: false));
      }
    });

    on<InitLoadChats>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingChats: true));
        emit(state.copyWith(page: 1));
        final String params =
            this.params(state.s, "0", state.limit.toString(), '');
        final response = await this.chatsRepo.getChats(event.context, params);
        if (response != null && response.statusCode == 200) {
          final chatsResponse = json.decode(response.body);
          final List<ChatResponse> chats = chatsResponse['data']
              .map((e) => ChatResponse.fromJson(e))
              .toList()
              .cast<ChatResponse>();
          final Pagination? pagination =
              Pagination.fromJson(chatsResponse['page']);
          emit(state.copyWith(chats: chats, pagination: pagination));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingChats: false));
      }
    });

    on<NewChatMessage>((event, emit) async {
      final chats = [
        ...?state.chats,
      ];
      final chat = chats.firstWhere((element) => element.id == event.chat.id,
          orElse: () => ChatResponse.fromJson({}));
      if (chat.id != null) {
        final List<ChatResponse> newChats = chats
            .map((chat) => proccessChat(chat, event))
            .toList()
            .cast<ChatResponse>();
        emit(state.copyWith(chats: newChats));
      } else {
        List<ChatResponse> newChats = [
          event.chat,
          ...?state.chats,
        ];
        emit(state.copyWith(chats: newChats));
      }
    });

    on<ChatView>((event, emit) async {
      this.chatsRepo.chatView(event.chat.id);
    });

    on<ChangeNotView>((event, emit) async {
      emit(state.copyWith(notView: event.notView));
    });

    on<ChangeSearch>((event, emit) async {
      emit(state.copyWith(s: event.search, selection: event.selection));
    });

    on<CreateChat>((event, emit) async {
      List<ChatResponse> newChats = [
        event.chat,
        ...?state.chats,
      ];
      emit(state.copyWith(chats: newChats, apartament: event.apartament));
    });

    on<ChangeLoadingToggle>((event, emit) {
      emit(state.copyWith(loadingToogle: event.loading));
    });
    on<ChangeToggle>((event, emit) {
      emit(state.copyWith(toogle: event.toogle));
    });
  }
}
