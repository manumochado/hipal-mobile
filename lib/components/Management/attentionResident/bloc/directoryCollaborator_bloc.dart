import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/Management/attentionResident/model/directoryCollaboratorModel.dart';
import 'package:hipal/components/Management/attentionResident/repository/directoryCollaborator_repository.dart';

part 'directoryCollaborator_event.dart';
part 'directoryCollaborator_state.dart';

class DirectoryCollaboratorBloc
    extends Bloc<DirectoryCollaboratorEvent, ResidentState> {
  final DirectoryCollaboratorRepository directoryCollaboratorRepo;

  loadMore(response, emit) {
    final schedueleResidentResponse = json.decode(response.body);
    List<dynamic> listData = schedueleResidentResponse['data'];
    if (listData.isEmpty) {
      emit(state.copyWith(resident: DirectoryCollaboratorModel()));
      return;
    }

    DirectoryCollaboratorModel? resident = DirectoryCollaboratorModel.fromJson(
        schedueleResidentResponse['data'][0]);

    List<Schedule> schedules = [];

    resident.schedule?.forEach((schedule) {
      if (schedule.times!.length > 0) {
        schedules.add(schedule);
      }
    });

    resident.schedule = schedules;

    emit(state.copyWith(resident: resident));
  }

  DirectoryCollaboratorBloc({required this.directoryCollaboratorRepo})
      : super(ResidentInitial()) {
    on<LoadSchedueleResident>((event, emit) async {
      final response = await this
          .directoryCollaboratorRepo
          .getSchedueleResident(event.context);
      print('** ** ** ** ** *** *** ** ** ** ');
      print(response);
      print('** ** ** ** ** *** *** ** ** ** ');
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });
  }
}
