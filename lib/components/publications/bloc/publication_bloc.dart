import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/publications/model/provider.dart';
import 'package:hipal/components/publications/model/publication_in_list.dart';
import 'package:hipal/components/publications/model/publication_in_list_by_residential.dart';
import 'package:hipal/components/publications/repository/publication_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/utils/general.dart';
part 'publication_event.dart';
part 'publication_state.dart';

class PublicationBloc extends Bloc<PublicationEvent, PublicationState> {
  final PublicationRepository publicationRepo;

  PublicationBloc({required this.publicationRepo})
      : super(PublicationInitial()) {
    on<LoadPublication>((event, emit) async {
      if (state.isLoading) return;
      emit(state.clearData());

      try {
        emit(state.copyWith(isLoading: true));
        final response = await this
            .publicationRepo
            .getPublication(event.context, event.publicationId);
        if (response != null) {
          final publicationResponse = json.decode(response);
          final PublicationInListByResidential? publication =
              PublicationInListByResidential.fromJson(publicationResponse);
          emit(state.copyWith(
              createdAt: publication?.createdAt,
              file: publication?.file,
              id: publication?.id,
              isPublic: publication?.isPublic,
              name: publication?.name,
              provider: publication?.provider,
              text: publication?.text,
              type: publication?.type,
              updatedAt: publication?.updatedAt));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}

class PublicationsBloc extends Bloc<PublicationEvent, PublicationsState> {
  final PublicationRepository publicationRepo;

  loadMore(publicationsResponse, emit) {
    final List<PublicationInList> publications = publicationsResponse['data']
        .map((e) => PublicationInList.fromJson(e))
        .toList()
        .cast<PublicationInList>();
    final Pagination? pagination =
        Pagination.fromJson(publicationsResponse['page']);

    if (publications.length > state.publications.length) {
      final newPublications = [
        ...publications,
      ];
      emit(state.copyWith(
          publications: newPublications, pagination: pagination));
    }
  }

  PublicationsBloc({required this.publicationRepo})
      : super(PublicationsInitial(publications: [])) {
    on<LoadPublicationsByProvider>((event, emit) async {
      if (state.isLoading) return;
      emit(state.clearData());
      try {
        emit(state.copyWith(isLoading: true));
        final response = await this.publicationRepo.getPublicationsFromProvider(
            event.context, event.providerId, event.publicationId);

        final publicationsResponse = json.decode(response);
        this.loadMore(publicationsResponse, emit);
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<LoadMorePublications>((event, emit) async {
      final response = await this.publicationRepo.getPublicationsFromProvider(
          event.context, event.providerId, event.publicationId);

      final publicationsResponse = json.decode(response);
      this.loadMore(publicationsResponse, emit);
    });

    on<LoadRefreshPublications>((event, emit) async {
      emit(state.copyWith(page: 1));
      final response = await this.publicationRepo.getPublicationsFromProvider(
          event.context, event.providerId, event.publicationId);

      final publicationsResponse = json.decode(response);
      final Pagination? pagination =
          Pagination.fromJson(publicationsResponse['page']);
      final List<PublicationInList> publications = publicationsResponse['data']
          .map((e) => PublicationInList.fromJson(e))
          .toList()
          .cast<PublicationInList>();

      emit(state.copyWith(publications: publications, pagination: pagination));
    });
  }
}
