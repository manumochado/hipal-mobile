import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/visitors/model/visit.dart';
import 'package:hipal/components/visitors/repository/visitors_repository.dart';

import 'package:hipal/serializers/pagination.dart';

part 'visitors_event.dart';
part 'visitors_state.dart';

class VisitorsBloc extends Bloc<VisitorsEvent, VisitorsState> {
  final VisitorsRepository visitorsRepository;

  params(String search, String page, String limit) {
    return "?limit=" + limit + "&page=" + page;
  }

  loadMore(response, emit) {
    final visitorsResponse = json.decode(response.body);
    final List<Visit> visitors = visitorsResponse['data']
        .map((e) => Visit.fromJson(e))
        .toList()
        .cast<Visit>();
    final newVisitors = [
      ...?state.visitors,
      ...visitors,
    ];
    emit(state.copyWith(visitors: newVisitors));
  }

  Visit proccessVisit(visit, compareVisit) {
    if (visit.id == compareVisit.visit.id) return compareVisit.visit;
    return visit;
  }

  VisitorsBloc({required this.visitorsRepository}) : super(VisitorsInitial()) {
    on<LoadRefreshVisitors>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params = this.params(state.s, "1", state.limit.toString());
      final response =
          await this.visitorsRepository.getVisitors(event.context, params);
      if (response != null && response.statusCode == 200) {
        final visitorsResponse = json.decode(response.body);
        final List<Visit> visitors = visitorsResponse['data']
            .map((e) => Visit.fromJson(e))
            .toList()
            .cast<Visit>();
        final Pagination? pagination =
            Pagination.fromJson(visitorsResponse['page']);
        emit(state.copyWith(visitors: visitors, pagination: pagination));
      }
    });

    on<LoadMoreVisitors>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
      final String params =
          this.params(state.s, state.page.toString(), state.limit.toString());
      final response =
          await this.visitorsRepository.getVisitors(event.context, params);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<DeleteVisitors>((event, emit) async {
      final response =
          await this.visitorsRepository.deleteVisitors(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        final visitors = [
          ...?state.visitors,
        ];
        final List<Visit> newVisitors = visitors
            .where((element) => element.id != event.id)
            .toList()
            .cast<Visit>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(visitors: newVisitors, pagination: pagination));
      }
    });

    on<LoadNewVisitors>((event, emit) async {
      final newVisitors = [
        event.visit,
        ...?state.visitors,
      ];
      final Pagination? pagination =
          state.pagination!.rebuild((b) => b..total = (b.total! + 1).toInt());
      emit(state.copyWith(visitors: newVisitors, pagination: pagination));
    });

    on<LoadEditVisit>((event, emit) async {
      final visitors = [
        ...?state.visitors,
      ];
      final List<Visit> newVisitors =
          visitors.map((visit) => proccessVisit(visit, event)).toList().cast();
      emit(state.copyWith(visitors: newVisitors));
    });

    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
