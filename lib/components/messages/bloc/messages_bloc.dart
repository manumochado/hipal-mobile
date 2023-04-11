import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/chats/repository/chats_repository.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/messages/repository/messages_repository.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

import '../../chats/model/ChatResponse.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository messagesRepo;
  final ChatsRepository chatsRepo;
  final storage = new FlutterSecureStorage();

  params(String search, String page, String limit, String startId) {
    return "?s=" +
        state.s +
        "&page=" +
        page +
        "&limit=" +
        state.limit.toString() +
        "&startId=" +
        startId;
  }

  MessagesBloc({required this.messagesRepo, required this.chatsRepo})
      : super(MessagesInitial()) {
    on<MessagesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadIdChat>((event, emit) async {
      emit(state.copyWith(chat: event.chat));
    });

    on<LoadRefreshMessages>((event, emit) async {
      try {
        emit(state.copyWith(page: 1, isLoadingMessages: true));
        final String params =
            this.params(state.s, "1", state.limit.toString(), '');

        final response = await this.messagesRepo.getMessages(
            event.context, params + "&chat=" + state.chat!.id.toString());

        if (response != null && response.statusCode == 200) {
          final messagesResponse = json.decode(response.body);

          dynamic user = await storage.read(key: 'userLogged');
          final Map<String, dynamic> userDecode = json.decode(user);
          final UserInfo? userModel = UserInfo.fromJson(userDecode);

          final List<Message> messages = messagesResponse['data']
              .map((e) {
                e['isSender'] = (userModel?.user?.id != e['user_send']['_id'])
                    ? false
                    : true;
                e['messageType'] = (e['type'] != null && e['type'] != "Message")
                    ? e['type'].toLowerCase()
                    : "text";
                return Message.fromJson(e);
              })
              .toList()
              .cast<Message>();

          final Pagination? pagination =
              Pagination.fromJson(messagesResponse['page']);
          emit(state.copyWith(messages: messages, pagination: pagination));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingMessages: false));
      }
    });

    on<LoadMoreMessages>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingMoreMessages: true));
        final String params = this.params(state.s, "", state.limit.toString(),
            state.messages!.last.id.toString());

        final response = await this.messagesRepo.getMessages(
            event.context, params + "&chat=" + state.chat!.id.toString());
        if (response != null && response.statusCode == 200) {
          final messagesResponse = json.decode(response.body);

          dynamic user = await storage.read(key: 'userLogged');
          final Map<String, dynamic> userDecode = json.decode(user);
          final UserInfo? userModel = UserInfo.fromJson(userDecode);

          final List<Message> messages = messagesResponse['data']
              .map((e) {
                e['isSender'] = (userModel?.user?.id != e['user_send']['_id'])
                    ? false
                    : true;
                e['messageType'] = (e['type'] != null && e['type'] != "Message")
                    ? e['type'].toLowerCase()
                    : "text";
                return Message.fromJson(e);
              })
              .toList()
              .cast<Message>();

          final Pagination? pagination =
              Pagination.fromJson(messagesResponse['page']);
          final newMessages = [
            ...?state.messages,
            ...messages,
          ];
          emit(state.copyWith(messages: newMessages, pagination: pagination));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingMoreMessages: false));
      }
    });

    on<MessageClear>((event, emit) async {
      emit(state.copyWith(messages: []));
    });

    on<TypeMessages>((event, emit) async {
      emit(state.copyWith(
          typeHeader: event.typeHeader, idEmergency: event.idEmergency));
    });

    on<NewMessage>((event, emit) async {
      if (event.message.chat?.id == state.chat?.id) {
        await this.chatsRepo.chatView(state.chat!.id.toString());
        final newMessages = [
          event.message,
          ...?state.messages,
        ];
        emit(state.copyWith(messages: newMessages));
      }
    });

    on<ChangeMessageInput>((event, emit) async {
      emit(state.copyWith(messageInput: event.message));
    });
  }
}
