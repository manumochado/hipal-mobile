part of 'coownership_bloc.dart';

@immutable
abstract class CoownershipEvent {}

class LoadRefreshCoownership extends CoownershipEvent {
  final BuildContext context;
  LoadRefreshCoownership(this.context);
}

class LoadMoreCoownership extends CoownershipEvent {
  final BuildContext context;
  LoadMoreCoownership(this.context);
}

class ChangeFromScreen extends CoownershipEvent {
  final String screen;
  ChangeFromScreen(this.screen);
}
