import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/powers_bloc.dart';
import 'package:hipal/components/assembly/model/powerAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_power_repository.dart';

import '../../model/power.dart';
import '../../model/powerAssemblyM.dart';

part 'formpower_event.dart';
part 'formpower_state.dart';

class FormpowerBloc extends Bloc<FormpowerEvent, FormpowerState> {
  final PowersRepository powersRepo;

  PowerAssemblyM proccessData(String field, value) {
    final PowerAssemblyM newPower;

    if (state.powerAssembly != null) {
      final Map<String, dynamic> objectPower =
          json.decode(json.encode(state.powerAssembly!.toJson()));
      objectPower[field] = value;
      newPower = PowerAssemblyM.fromJson(objectPower);
    } else {
      Map<String, dynamic> power = {field: value};
      newPower = PowerAssemblyM.fromJson(power);
    }

    return newPower;
  }

  FormpowerBloc({required this.powersRepo}) : super(FormpowerInitial()) {
    on<ChangePowerName>((event, emit) async {
      final PowerAssemblyM newPower = this.proccessData("name", event.name);
      emit(state.copyWith(powerAssembly: newPower));
    });

    on<ChangeIdentity>((event, emit) async {
      final PowerAssemblyM newPower =
          this.proccessData("identity", event.identity);
      emit(state.copyWith(powerAssembly: newPower));
    });

    on<ChangeEmail>((event, emit) async {
      final PowerAssemblyM newPower = this.proccessData("email", event.email);
      emit(state.copyWith(powerAssembly: newPower));
    });

    on<ChangeAssembly>((event, emit) async {
      final PowerAssemblyM newPower =
          this.proccessData("assembly", event.assembly);
      emit(state.copyWith(powerAssembly: newPower));
    });

    on<ResetFormPower>((event, emit) async {
      PowerAssemblyM newPower = PowerAssemblyM.fromJson({}) as PowerAssemblyM;
      emit(state.copyWith(powerAssembly: newPower, id: ''));
    });

    on<ChangeLoadingPower>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<SavePower>((event, emit) async {
      final Map<String, dynamic> data = {
        "giver_user_power": event.powerAssembly.giverUserPower,
        "external_user_owner_power": {
          
        },
        "users_representing": [],
        "assembly": event.powerAssembly.assembly,
        "user_owner_power": null,
        "is_external": true
      };
      emit(state.copyWith(isLoading: true));
      final response = await this.powersRepo.savePowersV2(event.context, data);
      emit(state.copyWith(isLoading: false));
    });

  }
}
