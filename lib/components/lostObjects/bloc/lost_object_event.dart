part of 'lost_object_bloc.dart';

@immutable
abstract class LostObjectEvent {}

class LoadLostObject extends LostObjectEvent {
  final BuildContext context;
  LoadLostObject(this.context);
}

class LoadRefreshLostObject extends LostObjectEvent {
  final BuildContext context;
  LoadRefreshLostObject(this.context);
}

class searchLostObject extends LostObjectEvent {
  final BuildContext context;
  final String searchText;
  searchLostObject(this.context, this.searchText);
}

class LoadMoreLostObject extends LostObjectEvent {
  final BuildContext context;
  LoadMoreLostObject(this.context);
}

class LoadEditLostObject extends LostObjectEvent {
  final LostObject lostObject;
  LoadEditLostObject(this.lostObject);
}

class EditLostObject extends LostObjectEvent {
  final BuildContext context;
  final String lockerId;
  final String state;
  EditLostObject(this.context, this.lockerId, this.state);
}