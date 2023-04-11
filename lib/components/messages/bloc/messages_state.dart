part of 'messages_bloc.dart';

@immutable
class MessagesState {
  final ChatResponse? chat;

  final Pagination? pagination;
  final List<Message>? messages;

  // Search Params
  final int page;
  final int limit;
  final String s;

  final String messageInput;
  final bool isLoadingMessages;
  final bool isLoadingMoreMessages;
  final String? typeHeader;
  final String? idEmergency;

  const MessagesState({
    this.chat,
    this.pagination,
    this.messages,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.messageInput = "",
    this.typeHeader = "",
    this.idEmergency = "",
    this.isLoadingMessages = false,
    this.isLoadingMoreMessages = false,
  });

  MessagesState copyWith({
    ChatResponse? chat,
    Pagination? pagination,
    List<Message>? messages,
    int? page,
    int? limit,
    String? s,
    String? messageInput,
    String? typeHeader,
    String? idEmergency,
    bool? isLoadingMessages,
    bool? isLoadingMoreMessages,
  }) =>
      MessagesState(
        chat: chat ?? this.chat,
        pagination: pagination ?? this.pagination,
        messages: messages ?? this.messages,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        messageInput: messageInput ?? this.messageInput,
        typeHeader: typeHeader ?? this.typeHeader,
        idEmergency: idEmergency ?? this.idEmergency,
        isLoadingMessages: isLoadingMessages ?? this.isLoadingMessages,
        isLoadingMoreMessages:
            isLoadingMoreMessages ?? this.isLoadingMoreMessages,
      );
}

class MessagesInitial extends MessagesState {}
