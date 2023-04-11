part of 'directory_bloc.dart';

@immutable
abstract class DirectoryEvent {}

class LoadDirectoryEmergency extends DirectoryEvent {
  final BuildContext context;
  LoadDirectoryEmergency(this.context);
}

class LoadRefreshDirectoryEmergency extends DirectoryEvent {
  final BuildContext context;
  LoadRefreshDirectoryEmergency(this.context);
}

class searchDirectoryEmergency extends DirectoryEvent {
  final BuildContext context;
  final String searchText;
  searchDirectoryEmergency(this.context, this.searchText);
}

class LoadMoreDirectoryEmergency extends DirectoryEvent {
  final BuildContext context;
  LoadMoreDirectoryEmergency(this.context);
}

class LoadRefreshDirectoryResidential extends DirectoryEvent {
  final BuildContext context;
  LoadRefreshDirectoryResidential(this.context);
}

class searchDirectoryResidential extends DirectoryEvent {
  final BuildContext context;
  final String searchText;
  searchDirectoryResidential(this.context, this.searchText);
}

class LoadMoreDirectoryResidential extends DirectoryEvent {
  final BuildContext context;
  LoadMoreDirectoryResidential(this.context);
}

class ChangeIndex extends DirectoryEvent {
  final int index;
  ChangeIndex(this.index);
}

