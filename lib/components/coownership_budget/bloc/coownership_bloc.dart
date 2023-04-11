import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/coownership_budget/model/coownership_budget.dart';
import 'package:hipal/components/coownership_budget/repository/coownership_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:meta/meta.dart';

part 'coownership_event.dart';
part 'coownership_state.dart';

class CoownershipBloc extends Bloc<CoownershipEvent, CoownershipState> {

  final CoownershipRepository coownershipRepo;

  params( String page, String limit){
    return "?page="+page+"&limit="+state.limit.toString();
  }

  getCoownership(response, emit) {
    print("+++++++++++++++++++++++ Bloc getCoownership");
    if( response!=null && response.statusCode == 200 ){
      final coownershipBudgetResponse = json.decode(response.body);
      final List<CoownershipBudget> listCoownership = coownershipBudgetResponse['data'].map((e) => CoownershipBudget.fromJson(e)).toList().cast<CoownershipBudget>();
      final Pagination? pagination = Pagination.fromJson(coownershipBudgetResponse['page']);
      print("------------------- ${listCoownership}");
      emit( state.copyWith(listCoownershipBudget: listCoownership, pagination: pagination ) );
    }
  }

  loadMoreResidential( response, emit){

    final coownershipBudgetResponse = json.decode(response.body);
    final List<CoownershipBudget> listCoownership = coownershipBudgetResponse['data'].map((e) => CoownershipBudget.fromJson(e)).toList().cast<CoownershipBudget>();
    final Pagination? pagination = Pagination.fromJson(coownershipBudgetResponse['page']);
    final newDirectoryResidential = [
      ...?state.listCoownershipBudget,
      ...listCoownership,
    ];
    emit( state.copyWith(listCoownershipBudget: newDirectoryResidential, pagination: pagination) );
  }

  CoownershipBloc({required this.coownershipRepo}) : super(CoownershipInitial()) {
    on<CoownershipEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadRefreshCoownership>((event, emit) async {
      print("+++++++++++++++++++++++ Bloc LoadRefreshCoownership");
      emit( state.copyWith(page: 1) );
      final String params = this.params(state.page.toString(),state.limit.toString());
      final response = await this.coownershipRepo.getCoownership(event.context, params);
      getCoownership(response, emit);
    });

    on<LoadMoreCoownership>((event, emit) async {
      emit(state.copyWith(page: state.page+1 ));
      final String params = this.params(state.page.toString(),state.limit.toString());
      final response = await this.coownershipRepo.getCoownership(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMoreResidential(response, emit);
    });

    on<ChangeFromScreen>((event, emit) async {
      emit( state.copyWith(fromScreen: event.screen) );
    });

  }
}
