part of 'chats_bloc.dart';

@immutable
abstract class ChatsEvent {}

class InitChat extends ChatsEvent {
  final BuildContext context;
  InitChat(this.context);
}

class ChatView extends ChatsEvent {
  final ChatResponse chat;
  ChatView(this.chat);
}

class ChangeLoadingToggle extends ChatsEvent {
  final bool loading;
  ChangeLoadingToggle(this.loading);
}

class ChangeSearchValue extends ChatsEvent {
  final String search;
  ChangeSearchValue(this.search);
}

class ChangeToggle extends ChatsEvent {
  final bool toogle;
  ChangeToggle(this.toogle);
}

class LoadChats extends ChatsEvent {
  final BuildContext context;
  LoadChats(this.context);
}

class InitLoadChats extends ChatsEvent {
  final BuildContext context;
  InitLoadChats(this.context);
}

class LoadRefreshChats extends ChatsEvent {
  final BuildContext context;
  LoadRefreshChats(this.context);
}

class ChangeNotView extends ChatsEvent {
  final int notView;
  ChangeNotView(this.notView);
}

class NewChatMessage extends ChatsEvent {
  final ChatResponse chat;
  NewChatMessage(this.chat);
}

class ChangeSearch extends ChatsEvent {
  final String? search;
  final int? selection;
  final String tower;
  ChangeSearch(this.search, this.selection, this.tower);
}

class CreateChat extends ChatsEvent {
  final ChatResponse chat;
  final String apartament;
  CreateChat(this.chat, this.apartament);
}
