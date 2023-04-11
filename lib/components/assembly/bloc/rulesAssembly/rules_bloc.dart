import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/assembly/model/rules.dart';
import 'package:hipal/components/assembly/repository/assembly_repository.dart';

part 'rules_event.dart';
part 'rules_state.dart';

class RulesBloc
    extends Bloc<RulesEvent, RulesState> {
  final AssemblyRepository rulesRepo;

  loadMore( response, emit){
    final rulesResponse = json.decode(response.body);
    final List<Rules> ruless = rulesResponse['data'].map((e) => Rules.fromJson(e)).toList().cast<Rules>();
    //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
    final newRules = [
      ...?state.rules,
      ...ruless,
    ];
    emit( state.copyWith(rules: newRules) );
  }

  getDirectoryEmergencies(response, emit) {

    if( response!=null && response.statusCode == 200 ){
      final LostObjectsResponse = json.decode(response.body);
      final List<Rules> listRules = LostObjectsResponse['data'].map((e) => Rules.fromJson(e)).toList().cast<Rules>();
      //final Pagination? pagination = Pagination.fromJson(LostObjectsResponse['page']);
      emit( state.copyWith(rules: listRules ) );
    }
  }

  RulesBloc({required this.rulesRepo})
      : super(RulesInitial()) {
    on<LoadRules>((event, emit) async {
      //final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');
      final response = await this.rulesRepo.getRulesAssembly(event.context);
  
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshRules>((event, emit) async {
      //emit( state.copyWith(page: 1 ) );
     // final String params = this.params(state.s,"1",state.limit.toString(), '');
      final response = await this.rulesRepo.getRulesAssembly(event.context);
      if( response!=null && response.statusCode == 200 ){
        final advertisementsResponse = json.decode(response.body);
        final List<Rules> advertisements = advertisementsResponse['data'].map((e) => Rules.fromJson(e)).toList().cast<Rules>();
        //final Pagination? pagination = Pagination.fromJson(petsResponse['page']);
        emit( state.copyWith(rules: advertisements) );
      }
    });
    
  }
}
