part of 'event_register_bloc.dart';

@immutable
abstract class EventRegisterEvent {}

class ChangeStateEventRegister extends EventRegisterEvent {
  final String state;
  ChangeStateEventRegister(this.state);
}

class LoadRefreshEventRegister extends EventRegisterEvent {
  final BuildContext context;
  final eventId;
  LoadRefreshEventRegister(this.context, this.eventId);
}

class LoadMoreEventRegister extends EventRegisterEvent {
  final BuildContext context;
  final userId;
  LoadMoreEventRegister(this.context, this.userId);
}

class CreateEventRegister extends EventRegisterEvent {
  final BuildContext context;
  final eventId;
  CreateEventRegister(this.context, this.eventId);
}

class deleteEventRegister extends EventRegisterEvent {
  final BuildContext context;
  final String id;
  deleteEventRegister(this.context, this.id);
}