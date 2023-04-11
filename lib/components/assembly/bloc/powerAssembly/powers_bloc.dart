import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/model/powerAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_power_repository.dart';

import 'package:hipal/serializers/pagination.dart';

import '../../model/power.dart';
import '../../model/powerAssemblyM.dart';

part 'powers_event.dart';
part 'powers_state.dart';

class PowersBloc extends Bloc<PowersEvent, PowersState> {
  final PowersRepository powersRepo;

  params(String search, String page, String limit, String startId) {
    return "?s=" +
        state.s +
        "&page=" +
        page +
        "&limit=" +
        state.limit.toString() +
        "&startId=" +
        startId;
  }

  loadMore(response, emit) {
    final powersResponse = json.decode(response.body);
    final List<PowerAssemblyM> powers = powersResponse['data']
        .map((e) => PowerAssemblyM.fromJson(e))
        .toList()
        .cast<PowerAssemblyM>();
    final Pagination? pagination = Pagination.fromJson(powersResponse['page']);
    final newPowers = [
      ...?state.powerAssemblies,
      ...powers,
    ];
    emit(state.copyWith(powerAssemblies: newPowers, pagination: pagination));
  }

  PowerAssemblyM proccessPower(power, comparePower) {
    if (power.id == comparePower.power.id) return comparePower.power;
    return power;
  }

  PowersBloc({required this.powersRepo}) : super(PowersInitial()) {
    on<LoadPowers>((event, emit) async {
      final String params = this
          .params(state.s, state.page.toString(), state.limit.toString(), '');
      final response = await this.powersRepo.getPowers(event.context, params);

      
      if (response != null && response.statusCode == 200){
        this.loadMore(response, emit);
      }
        
    });

    on<LoadRefreshPowers>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params =
          this.params(state.s, "1", state.limit.toString(), '');
      final response = await this.powersRepo.getPowers(event.context, params);
      if (response != null && response.statusCode == 200) {
        final powersResponse = json.decode(response.body);
        final List<PowerAssemblyM> powerAssemblies = powersResponse['data']
            .map((e) => PowerAssemblyM.fromJson(e))
            .toList()
            .cast<PowerAssemblyM>();
        final Pagination? pagination =
            Pagination.fromJson(powersResponse['page']);
        emit(state.copyWith(
            powerAssemblies: powerAssemblies, pagination: pagination));
      }
    });

    on<LoadMorePowers>((event, emit) async {
      final String params = this.params(state.s, "", state.limit.toString(),
          state.powerAssemblies!.last.sId.toString());
      final response = await this.powersRepo.getPowers(event.context, params);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<DeletePower>((event, emit) async {
      final response =
          await this.powersRepo.deletePower(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        final powers = [
          ...?state.powerAssemblies,
        ];
        final List<PowerAssemblyM> newPowers = powers
            .where((element) => element.sId != event.id)
            .toList()
            .cast<PowerAssemblyM>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(
            state.copyWith(powerAssemblies: newPowers, pagination: pagination));
      }
    });

    on<LoadNewPower>((event, emit) async {
      final List<PowerAssemblyM> newPowers = [
        event.powerAssemblies,
        ...?state.powerAssemblies,
      ];
      //final Pagination? pagination =  state.pagination!.rebuild((b) => b..total = (b.total! + 1).toInt());
      emit(state.copyWith(powerAssemblies: newPowers));
    });

    on<LoadEditPower>((event, emit) async {
      final powers = [
        ...?state.powerAssemblies,
      ];
      final List<PowerAssemblyM> newPowers =
          powers.map((power) => proccessPower(power, event)).toList().cast();
      emit(state.copyWith(powerAssemblies: newPowers));
    });

    on<ChangeIndexPower>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
