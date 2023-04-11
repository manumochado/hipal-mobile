import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/Management/informationManagement/model/management.dart';
import 'package:hipal/components/Management/informationManagement/repository/management_repository.dart';

import 'package:hipal/serializers/pagination.dart';

part 'management_event.dart';
part 'management_state.dart';

class ManagementBloc extends Bloc<ManagementEvent, ManagementState> {
  final ManagementRepository managementRepository;

  loadMore(response, emit) {
    final managementsResponse = json.decode(response.body);
    print('*********** managementsResponse **********');
    print(managementsResponse);
    print('*********** managementsResponse **********');

    if (managementsResponse['data'].length > 0) {
      final Management? management =
          Management.fromJson(managementsResponse['data'][0]);
      print('pase el management List');
      print(management);
      emit(state.copyWith(managements: management));
    }
  }

  Management proccessManagement(management, compareManagement) {
    if (management.id == compareManagement.management.id)
      return compareManagement.management;
    return management;
  }

  ManagementBloc({required this.managementRepository})
      : super(ManagementInitial()) {
    on<LoadManagement>((event, emit) async {
      final response = await this
          .managementRepository
          .getInformationManagement(event.context);
      print('__________ response en el loadManagement ___________');
      print(response);
      print('__________________');
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });
  }
}
