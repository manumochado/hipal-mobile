part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}

class MessageClear extends MessagesEvent {
  MessageClear();
}

class LoadIdChat extends MessagesEvent {
  final ChatResponse? chat;
  LoadIdChat(this.chat);
}

class TypeMessages extends MessagesEvent {
  final String? typeHeader;
  final String? idEmergency;
  TypeMessages(this.typeHeader, this.idEmergency);
}

class LoadRefreshMessages extends MessagesEvent {
  final BuildContext context;
  LoadRefreshMessages(this.context);
}

class LoadMoreMessages extends MessagesEvent {
  final BuildContext context;
  LoadMoreMessages(this.context);
}

class NewMessage extends MessagesEvent {
  final Message message;
  NewMessage(this.message);
}

class TempMessage extends MessagesEvent {
  final String message;
  TempMessage(this.message);
}

class ChangeMessageInput extends MessagesEvent {
  final String? message;
  ChangeMessageInput(this.message);
}
