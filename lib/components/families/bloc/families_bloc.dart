import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/components/families/model/family.dart';

import 'package:hipal/components/families/repository/families_repository.dart';

part 'families_event.dart';
part 'families_state.dart';

class FamiliesBloc extends Bloc<FamiliesEvent, FamiliesState> {
  final FamiliesRepository familiesRepo;

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

  loadMore(response, emit, {bool refresh = false}) {
    final familiesResponse = json.decode(response.body);
    print(familiesResponse);
    final List<Family> families = familiesResponse['data']
        .map((e) => Family.fromJson(e))
        .toList()
        .cast<Family>();
    final Pagination? pagination =
        Pagination.fromJson(familiesResponse['page']);
    final newFamilies = refresh
        ? families
        : [
            ...?state.families,
            ...families,
          ];
    emit(state.copyWith(families: newFamilies, pagination: pagination));
  }

  Family proccessFamily(family, compareFamily) {
    if (family.id == compareFamily.family.id) return compareFamily.family;
    return family;
  }

  FamiliesBloc({required this.familiesRepo}) : super(FamiliesInitial()) {
    on<LoadFamilies>((event, emit) async {
      if (state.isLoading) return;

      final String params = this
          .params(state.s, state.page.toString(), state.limit.toString(), '');

      try {
        emit(state.copyWith(isLoading: true));
        final response =
            await this.familiesRepo.getFamilies(event.context, params);
        if (response != null && response.statusCode == 200)
          this.loadMore(response, emit, refresh: true);
      } catch (e) {
        print(e);
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<LoadRefreshFamilies>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params =
          this.params(state.s, "1", state.limit.toString(), '');

      try {
        final response =
            await this.familiesRepo.getFamilies(event.context, params);
        if (response != null && response.statusCode == 200) {
          this.loadMore(response, emit, refresh: true);
        }
      } catch (e) {
        print(e);
      }
    });

    on<LoadMoreFamilies>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
      final String params = this
          .params(state.s, state.page.toString(), state.limit.toString(), "");

      final response =
          await this.familiesRepo.getFamilies(event.context, params);
      if (response != null && response.statusCode == 200)
        this.loadMore(response, emit);
    });

    on<DeleteFamily>((event, emit) async {
      final response =
          await this.familiesRepo.deleteFamily(event.context, event.id);
      print(response.statusCode);
      if (response != null && response.statusCode == 200) {
        final families = [
          ...?state.families,
        ];
        final List<Family> newFamilies = families
            .where((element) => element.id != event.id)
            .toList()
            .cast<Family>();

        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(families: newFamilies, pagination: pagination));
      }
    });

    on<LoadNewFamily>((event, emit) async {
      print(event.family);
      final newFamilies = [
        event.family,
        ...?state.families,
      ];
      final Pagination? pagination =
          state.pagination!.rebuild((b) => b..total = (b.total! + 1).toInt());
      emit(state.copyWith(families: newFamilies, pagination: pagination));
    });

    on<LoadEditFamily>((event, emit) async {
      final families = [
        ...?state.families,
      ];
      final List<Family> newFamilies = families
          .map((family) => proccessFamily(family, event))
          .toList()
          .cast();
      emit(state.copyWith(families: newFamilies));
    });

    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });
  }
}
