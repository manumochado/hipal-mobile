part of 'currentlyAssembly_bloc.dart';

@immutable
abstract class CurrentlyAssemblyEvent {}

class LoadCurrentlyAssembly extends CurrentlyAssemblyEvent {
  final BuildContext context;
  LoadCurrentlyAssembly(this.context);
}

class ChangeCommonZone extends CurrentlyAssemblyEvent {
  final CurrentlyAssembly commonZone;
  ChangeCommonZone(this.commonZone);
}

class LoadRefreshCurrentlyAssembly extends CurrentlyAssemblyEvent {
  final BuildContext context;
  LoadRefreshCurrentlyAssembly(this.context);
}
