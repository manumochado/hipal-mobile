part of 'powers_bloc.dart';

@immutable
abstract class PowersEvent {}

class InitPowers extends PowersEvent {
  final BuildContext context;
  InitPowers(this.context);
}

class LoadPowers extends PowersEvent {
  final BuildContext context;
  LoadPowers(this.context);
}

class LoadRefreshPowers extends PowersEvent {
  final BuildContext context;
  LoadRefreshPowers(this.context);
}

class LoadMorePowers extends PowersEvent {
  final BuildContext context;
  LoadMorePowers(this.context);
}

class ChangeIndexPower extends PowersEvent {
  final int index;
  ChangeIndexPower(this.index);
}

class DeletePower extends PowersEvent {
  final BuildContext context;
  final String id;
  DeletePower(this.context, this.id);
}

class LoadNewPower extends PowersEvent {
  final PowerAssemblyM powerAssemblies;
  LoadNewPower(this.powerAssemblies);
}

class LoadEditPower extends PowersEvent {
  final PowerAssemblyM powerAssembly;
  LoadEditPower(this.powerAssembly);
}

