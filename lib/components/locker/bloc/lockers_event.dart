part of 'lockers_bloc.dart';

@immutable
abstract class LockersEvent {}

class ChangeStateLocker extends LockersEvent {
  final String state;
  ChangeStateLocker(this.state);
}

class LoadRefreshLocker extends LockersEvent {
  final BuildContext context;
  final String state;
  LoadRefreshLocker(this.context, this.state);
}

class EditLocker extends LockersEvent {
  final BuildContext context;
  final String lockerId;
  final String state;
  EditLocker(this.context, this.lockerId, this.state);
}

class LoadMoreLocker extends LockersEvent {
  final BuildContext context;
  final String state;
  LoadMoreLocker(this.context, this.state);
}

class ChangeIndex extends LockersEvent {
  final int index;
  ChangeIndex(this.index);
}
