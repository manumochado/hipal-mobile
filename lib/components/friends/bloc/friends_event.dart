part of 'friends_bloc.dart';

@immutable
abstract class FriendsEvent {}

class LoadRefreshFriends extends FriendsEvent {
  final BuildContext context;
  final String userID;
  LoadRefreshFriends(this.context, this.userID);
}

class ChangeFormFriends extends FriendsEvent {
  final bool open;
  ChangeFormFriends(this.open);
}

class searchFriends extends FriendsEvent {
  final BuildContext context;
  final String userID;
  final String searchText;
  searchFriends(this.context, this.userID, this.searchText);
}

class ChangeLoadingFriend extends FriendsEvent {
  final bool isLoading;
  ChangeLoadingFriend(this.isLoading);
}

class LoadNewFriend extends FriendsEvent {
  final Friends friends;
  LoadNewFriend(this.friends);
}

class DeleteFriend extends FriendsEvent {
  final BuildContext context;
  final String id;
  DeleteFriend(this.context, this.id);
}
