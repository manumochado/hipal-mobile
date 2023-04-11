part of 'management_bloc.dart';

@immutable
abstract class ManagementEvent {}

class LoadManagement extends ManagementEvent {
  final BuildContext context;
  LoadManagement(this.context);
}
