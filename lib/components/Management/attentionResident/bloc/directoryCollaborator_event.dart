part of 'directoryCollaborator_bloc.dart';

@immutable
abstract class DirectoryCollaboratorEvent {}

class LoadSchedueleResident extends DirectoryCollaboratorEvent {
  final BuildContext context;
  LoadSchedueleResident(this.context);
}
class LoadRefreshSchedueleResident extends DirectoryCollaboratorEvent {
  final BuildContext context;
  LoadRefreshSchedueleResident(this.context);
}

