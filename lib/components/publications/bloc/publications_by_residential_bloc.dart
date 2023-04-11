import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/publications/model/publication_in_list_by_residential.dart';
import 'package:hipal/components/publications/repository/publication_repository.dart';
import 'package:hipal/serializers/pagination.dart';

part 'publications_by_residential_event.dart';
part 'publications_by_residential_state.dart';

class PublicationsByResidentialBloc extends Bloc<PublicationsByResidentialEvent,
    PublicationsByResidentialState> {
  final PublicationRepository publicationRepo;
  params(String limit, String page) {
    return "?limit=" + limit + "&page=" + page;
  }

  loadMore(publicationsResponse, emit) {
    final List<PublicationInListByResidential> publications =
        publicationsResponse['data']
            .map((e) => PublicationInListByResidential.fromJson(e))
            .toList()
            .cast<PublicationInListByResidential>();
    final Pagination? pagination =
        Pagination.fromJson(publicationsResponse['page']);
    final newPublications = [
      ...state.publications,
      ...publications,
    ];
    emit(state.copyWith(publications: newPublications, pagination: pagination));
  }

  PublicationsByResidentialBloc({required this.publicationRepo})
      : super(PublicationsInitial(publications: [])) {
    on<LoadPublicationsByResidential>((event, emit) async {
      int? page = state.pagination?.page?.toInt() ?? 0;
      int? lastPage = state.pagination?.lastPage?.toInt() ?? 1;
      if ((page + 1) > lastPage) {
        return;
      }
      var params = "";
      params = this.params("", (page + 1).toString());

      final response = await this
          .publicationRepo
          .getPublicabionsByResidential(event.context, params);
      if (response != null) {
        final publicationsResponse = json.decode(response);
        this.loadMore(publicationsResponse, emit);
      }
    });

    on<LoadMorePublicationsByResidential>((event, emit) async {
      print("*****  Publications LoadMore  *****");
      int? page = state.pagination?.page?.toInt() ?? 0;
      int? lastPage = state.pagination?.lastPage?.toInt() ?? 1;
      if ((page + 1) > lastPage) {
        return;
      }

      var params = this.params("", (page + 1).toString());
      final response = await this
          .publicationRepo
          .getPublicabionsByResidential(event.context, params);

      if (response != null) {
        final publicationsResponse = json.decode(response);
        this.loadMore(publicationsResponse, emit);
      }
    });

    on<LoadRefreshPublicationsByResidential>((event, emit) async {
      print("*****  Publications LoadRefreshEvents  *****");
      var params = this.params("", "1");
      final response = await this
          .publicationRepo
          .getPublicabionsByResidential(event.context, params);
      if (response != null) {
        final publicationsResponse = json.decode(response);
        final List<PublicationInListByResidential> publications =
            publicationsResponse['data']
                .map((e) => PublicationInListByResidential.fromJson(e))
                .toList()
                .cast<PublicationInListByResidential>();
        final Pagination? pagination =
            Pagination.fromJson(publicationsResponse['page']);
        emit(
            state.copyWith(publications: publications, pagination: pagination));
      }
    });
  }
}
