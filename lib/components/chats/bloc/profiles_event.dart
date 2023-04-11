part of 'profiles_bloc.dart';

@immutable
abstract class ProfilesEvent {}

class InitProfile extends ProfilesEvent {
  final BuildContext context;
  InitProfile(this.context);
}

class ProfileView extends ProfilesEvent {
  final Profile chat;
  ProfileView(this.chat);
}

class ResetProfilesSearch extends ProfilesEvent {
  ResetProfilesSearch();
}

class LoadProfiles extends ProfilesEvent {
  final BuildContext context;
  LoadProfiles(this.context);
}

class LoadRefreshProfiles extends ProfilesEvent {
  final BuildContext context;
  LoadRefreshProfiles(this.context);
}

class ChangeSearchProfile extends ProfilesEvent {
  final String? search;
  final String? tower;
  ChangeSearchProfile(this.search, this.tower);
}
