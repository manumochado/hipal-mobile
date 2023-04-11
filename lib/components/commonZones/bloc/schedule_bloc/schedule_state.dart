part of 'schedule_bloc.dart';

@immutable
class ScheduleState {

  final String title;
  final Schedule? shcedule;
  


  const ScheduleState({
    this.title = 'Horarios',

    this.shcedule,
  });

  ScheduleState copyWith({
    String? title,
    Pagination? pagination,
    Schedule? shcedule,
 
  }) => ScheduleState(
    title: title ?? this.title,
    shcedule: shcedule ?? this.shcedule,
  );
}

class ScheduleInitial extends ScheduleState {}
