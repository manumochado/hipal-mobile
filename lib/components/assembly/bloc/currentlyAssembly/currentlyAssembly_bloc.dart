import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_repository.dart';

part 'currentlyAssembly_event.dart';
part 'currentlyAssembly_state.dart';

class CurrentlyAssemblyBloc
    extends Bloc<CurrentlyAssemblyEvent, CurrentlyAssemblyState> {
  final AssemblyRepository assemblyRepo;

  loadMore(response, emit) {
    final historyAssemblyResponse = json.decode(response.body);
    final List<CurrentlyAssembly> historyAssemblies =
        historyAssemblyResponse['data']
            .map((e) => CurrentlyAssembly.fromJson(e))
            .toList()
            .cast<CurrentlyAssembly>();
    print('********** *************** **********');
    print(historyAssemblies);
    print('********** *************** **********');
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newHistoryAssemblies = [
      ...?state.currentlyAssemblies,
      ...historyAssemblies,
    ];
    emit(state.copyWith(currentlyAssemblies: newHistoryAssemblies));
  }

  getDirectoryEmergencies(response, emit) {
    if (response != null && response.statusCode == 200) {
      final LostObjectsResponse = json.decode(response.body);
      final List<CurrentlyAssembly> listHistoryAssembly =
          LostObjectsResponse['data']
              .map((e) => CurrentlyAssembly.fromJson(e))
              .toList()
              .cast<CurrentlyAssembly>();
      //final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit(state.copyWith(currentlyAssemblies: listHistoryAssembly));
    }
  }

  CurrentlyAssemblyBloc({required this.assemblyRepo})
      : super(CurrentlyAssemblyInitial()) {
    on<LoadCurrentlyAssembly>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response =
          await this.assemblyRepo.getCurrentlyAssembly(event.context);

      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<LoadRefreshCurrentlyAssembly>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
      // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response =
          await this.assemblyRepo.getCurrentlyAssembly(event.context);
      if (response != null && response.statusCode == 200) {
        final historyAssemblyResponse = json.decode(response.body);
        final List<CurrentlyAssembly> historyAssembly =
            historyAssemblyResponse['data']
                .map((e) => CurrentlyAssembly.fromJson(e))
                .toList()
                .cast<CurrentlyAssembly>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit(state.copyWith(currentlyAssemblies: historyAssembly));
      }
    });
  }
}
