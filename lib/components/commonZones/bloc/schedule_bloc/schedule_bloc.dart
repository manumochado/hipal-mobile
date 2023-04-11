import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/commonZones/repository/common_zones_repository.dart';
import 'package:hipal/serializers/pagination.dart';

import '../../model/schedule.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final CommonZonesRepository commonZonesRepo;

  ScheduleBloc({required this.commonZonesRepo}) : super(ScheduleInitial()) {
    on<LoadSchedules>((event, emit) async {
      final response = await this
          .commonZonesRepo
          .getScheduleForId(event.context, event.id, event.date);
      if (response != null && response.statusCode == 200) {
        final scheduleResponse = json.decode(response.body);
        final Schedule? schedule = Schedule.fromJson(scheduleResponse);
        emit(state.copyWith(shcedule: schedule));
      }
    });
  }
}
