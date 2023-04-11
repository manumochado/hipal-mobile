part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}


class LoadSchedules extends ScheduleEvent {
  final BuildContext context;
  final String id;
  final String date;
  LoadSchedules(this.context, this.id, this.date);
}
