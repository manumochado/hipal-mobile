import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/model/historyAssembly.dart';
import 'package:hipal/components/assembly/repository/assembly_repository.dart';

part 'historyAssembly_event.dart';
part 'historyAssembly_state.dart';

class HistoryAssemblyBloc
    extends Bloc<HistoryAssemblyEvent, HistoryAssemblyState> {
  final AssemblyRepository assemblyRepo;

  loadMore(response, emit) {
    final historyAssembliesResponse = json.decode(response.body);
    print(
        '_______________________ historyAssembliesResponse ________________ ___________');
    print(historyAssembliesResponse);
    print(
        '_______________________ final historyAssembliesResponse ________________ ___________');
    final List<HistoryAssembly> historyAssemblies =
        historyAssembliesResponse['data']
            .map((e) => HistoryAssembly.fromJson(e))
            .toList()
            .cast<HistoryAssembly>();
    print('_______________________ ________________ ___________');
    print(historyAssemblies);
    print('_______________________ ________________ ___________');
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newHistoryAssemblies = [
      ...?state.historyAssemblies,
      ...historyAssemblies,
    ];
    emit(state.copyWith(historyAssemblies: newHistoryAssemblies));
  }

  getDirectoryEmergencies(response, emit) {
    if (response != null && response.statusCode == 200) {
      final LostObjectsResponse = json.decode(response.body);
      final List<HistoryAssembly> listHistoryAssemblies =
          LostObjectsResponse['data']
              .map((e) => HistoryAssembly.fromJson(e))
              .toList()
              .cast<HistoryAssembly>();
      //final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit(state.copyWith(historyAssemblies: listHistoryAssemblies));
    }
  }

  HistoryAssemblyBloc({required this.assemblyRepo})
      : super(HistoryAssemblyInitial()) {
    on<LoadHistoryAssembly>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response =
          await this.assemblyRepo.getHistoryAssembly(event.context);

      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<LoadRefreshHistoryAssembly>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
      // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response =
          await this.assemblyRepo.getHistoryAssembly(event.context);
      if (response != null && response.statusCode == 200) {
        final HistoryAssembliesResponse = json.decode(response.body);
        final List<HistoryAssembly> historyAssemblies =
            HistoryAssembliesResponse['data']
                .map((e) => HistoryAssembly.fromJson(e))
                .toList()
                .cast<HistoryAssembly>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit(state.copyWith(historyAssemblies: historyAssemblies));
      }
    });
  }
}
