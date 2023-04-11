import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';
import 'package:hipal/components/classifieds/ui/widgets/detailsClassified.dart';
import 'package:hipal/components/publications/bloc/publication_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/services/notification_service.dart';

import '../../model/classifieds_response.dart';

part 'classifieds_event.dart';
part 'classifieds_state.dart';

class ClassifiedsBloc extends Bloc<ClassifiedsEvent, ClassifiedsState> {
  final ClassifiedsRepository classifiedsRepo;
  final PublicationsBloc publicationsBloc;

  params({
    required String search,
    required int page,
    required int limit,
    required String idUser,
    required String state,
  }) =>
      '?limit=${limit}&page=${page}&usser=${idUser}&state=${state}';

  Classified proccessClassified(
      Classified classified, Classified newClassified) {
    if (classified.id == newClassified.id) return newClassified;
    return classified;
  }

  ClassifiedsBloc({
    required this.classifiedsRepo,
    required this.publicationsBloc,
  }) : super(ClassifiedsInitial()) {
    on<LoadGeneralClassifieds>((event, emit) async {
      late int page;

      if (event.refresh) {
        page = 1;
      } else {
        page = state.generalPagination?.page ?? 0;
        int? lastPage = state.generalPagination?.lastPage ?? 1;
        page += 1;

        if (page > lastPage) return;
      }

      final userBloc = BlocProvider.of<UserBloc>(event.context);

      String? userId = userBloc.state.userInfo?.user!.id ?? "";

      if (userId == '') {
        NotificationService.showToast(event.context,
            message:
                'No se pudo continuar, no se pudo obtener la información del usuario autenticado.');
        return;
      }

      final params = this.params(
        search: "",
        page: page,
        limit: state.limit,
        idUser: "",
        state: "Aprobado",
      );

      try {
        emit(state.copyWith(isLoadingGeneralClassifieds: true));

        final response =
            await this.classifiedsRepo.getclassified(event.context, params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null && response.statusCode == 200) {
          final classifiedsResponse =
              ClassifiedResponse.fromJson(response.body);

          final classifieds = classifiedsResponse.data;

          final Pagination? pagination =
              Pagination.fromJson(classifiedsResponse.page.toMap());

          emit(state.copyWith(
            page: page,
            generalClassifieds: event.refresh
                ? classifieds
                : [...state.generalClassifieds, ...classifieds],
            generalPagination: pagination,
          ));
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isLoadingGeneralClassifieds: false));
      }
    });

    on<LoadUserClassifieds>((event, emit) async {
      late int page;

      if (event.refresh) {
        page = 1;
      } else {
        page = state.userPagination?.page ?? 0;
        int? lastPage = state.userPagination?.lastPage ?? 1;
        page += 1;

        if (page > lastPage) return;
      }

      final userBloc = BlocProvider.of<UserBloc>(event.context);

      String? userId = userBloc.state.userInfo?.user!.id ?? "";

      if (userId == '') {
        NotificationService.showToast(event.context,
            message:
                'No se pudo continuar, no se pudo obtener la información del usuario autenticado.');
        return;
      }

      final params = this.params(
        search: "",
        page: page,
        limit: state.limit,
        idUser: userId,
        state: "",
      );

      try {
        emit(state.copyWith(isLoadingUserClassifieds: true));

        final response =
            await this.classifiedsRepo.getclassified(event.context, params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null && response.statusCode == 200) {
          final classifiedsResponse =
              ClassifiedResponse.fromJson(response.body);

          final classifieds = classifiedsResponse.data;

          final Pagination? pagination =
              Pagination.fromJson(classifiedsResponse.page.toMap());

          emit(state.copyWith(
              page: page,
              userClassifieds: event.refresh
                  ? classifieds
                  : [...state.userClassifieds, ...classifieds],
              userPagination: pagination));
        }
      } catch (e, stack) {
        print("Error Classifields $stack");
      } finally {
        emit(state.copyWith(isLoadingUserClassifieds: false));
      }
    });

    on<CreateNewClassified>((event, emit) async {
      try {
        emit(state.copyWith(isSaving: true));

        final response = await this
            .classifiedsRepo
            .saveClassified(event.context, event.params);

        if (response != null &&
            (response.statusCode == 200 || response.statusCode == 201)) {
          Classified newClassified = Classified.fromJson(response.body);
          add(LoadNewClassified(newClassified));
          event.onComplete();
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });

    on<UpdateClassified>((event, emit) async {
      try {
        emit(state.copyWith(isSaving: true));

        final response = await this
            .classifiedsRepo
            .editClassified(event.context, event.id, event.params);

        if (response != null &&
            (response.statusCode == 200 || response.statusCode == 201)) {
          Classified newClassified = Classified.fromJson(response.body);
          add(LoadEditClassified(
              classified: newClassified, isUserClassified: true));
          event.onComplete();
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });

    on<DeleteUserClassified>((event, emit) async {
      final response =
          await this.classifiedsRepo.DeleteClassified(event.context, event.id);

      if (response) {
        final classifieds = state.userClassifieds;

        final List<Classified> newClassifieds =
            classifieds.where((element) => element.id != event.id).toList();

        newClassifieds.removeWhere((element) => element.id == event.id);

        emit(state.copyWith(userClassifieds: newClassifieds));
      }
    });

    on<LoadNewClassified>((event, emit) async {
      final newClassifieds = [
        event.classified,
        ...state.userClassifieds,
      ];
      emit(state.copyWith(userClassifieds: newClassifieds));
    });

    on<LoadEditClassified>((event, emit) async {
      final classifieds = event.isUserClassified
          ? state.userClassifieds
          : state.generalClassifieds;

      final List<Classified> newClassifieds = classifieds
          .map((classified) => proccessClassified(classified, event.classified))
          .toList();

      event.isUserClassified
          ? emit(state.copyWith(userClassifieds: newClassifieds))
          : emit(state.copyWith(generalClassifieds: newClassifieds));
    });

    on<LoadDetailClassified>((event, emit) async {
      emit(state.copyWith(classifiedDetail: event.classified));
    });

    on<LoadDetailClassifiedFromNotification>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingFromNotification: true));
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => DetailsClassified(owner: 'owner'),
          ),
        );
        final response = await this
            .classifiedsRepo
            .loadClassifield(event.context, event.idClassified);

        if (response != null) {
          Classified classified = Classified.fromJson(response.body);
          add(LoadDetailClassified(classified: classified));
        }
      } catch (err) {
        print("Error to load from notification classifield $err");
      } finally {
        emit(state.copyWith(isLoadingFromNotification: false));
      }
    });

    on<ChangeClassifiedsTabIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });

    on<OnClearData>((event, emit) async {
      emit(state.clearData());
    });

    on<ToggleLikeClassified>((event, emit) async {
      final response =
          await this.classifiedsRepo.likeClassified(event.context, event.id);

      if (response != null && response.statusCode == 200) {
        Classified classified = Classified.fromJson(response.body);
        emit(state.copyWith(classifiedDetail: classified));

        add(LoadEditClassified(
            classified: classified, isUserClassified: event.isUserClassified));
      }
    });

    on<InitTap>((event, emit) async {
      emit(state.copyWith(indexTab: 1));
    });

    on<NewComment>((event, emit) async {
      final List<Classified> classifieds = event.owner == "admin"
          ? state.generalClassifieds
          : state.userClassifieds;

      if (classifieds
          .where((element) => element.id == event.idClassified)
          .isEmpty) {
        Classified classifiedDetail = state.classifiedDetail!;
        classifiedDetail.commentsCount += 1;
        emit(state.copyWith(classifiedDetail: classifiedDetail));
        return;
      }

      Classified classified =
          classifieds.firstWhere((element) => element.id == event.idClassified);

      int index = classifieds.indexOf(classified);

      int? commentsCount = classified.commentsCount;

      classified.commentsCount = commentsCount + 1;

      classifieds.removeWhere((element) => element.id == event.idClassified);

      classifieds.insert(index, classified);

      if (event.owner == "admin") {
        emit(state.copyWith(
            generalClassifieds: classifieds, classifiedDetail: classified));
      } else {
        emit(state.copyWith(
            userClassifieds: classifieds, classifiedDetail: classified));
      }
    });
  }
}
