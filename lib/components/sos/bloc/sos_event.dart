part of 'sos_bloc.dart';

@immutable
abstract class SosEvent {}

class InitChatSos extends SosEvent {
  final BuildContext context;
  InitChatSos(this.context);
}
class CreateEmergency extends SosEvent {
  final BuildContext context;
  CreateEmergency(this.context);
}

class ChangeIsEmergency extends SosEvent {
  final bool isEmergency;
  ChangeIsEmergency(this.isEmergency);
}

class ChangeStatusEmergency extends SosEvent {
  final bool status;
  ChangeStatusEmergency(this.status);
}

class LoadEmergency extends SosEvent {
  final BuildContext context;
  LoadEmergency(this.context);
}

class ClosedEmergency extends SosEvent {
  final BuildContext context;
  final String id;
  ClosedEmergency(this.context, this.id);
}