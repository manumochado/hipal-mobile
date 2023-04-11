import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/resident_experience/model/category_pqr_response.dart';
import 'package:hipal/components/resident_experience/model/resident_experience_response.dart';
import 'package:hipal/components/resident_experience/model/type_pqr_response.dart';
import 'package:hipal/components/resident_experience/repository/resident_experience_repository.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/services/notification_service.dart';

part 'resident_experience_event.dart';
part 'resident_experience_state.dart';

class ResidentExperienceBloc
    extends Bloc<ResidentExperienceEvent, ResidentExperienceState> {
  final ResidentExperienceRepository residentExperienceRepo;

  bool isMounted = false;

  @override
  void emit(ResidentExperienceState state) {
    if (isMounted) {
      super.emit(state);
    }
  }

  Future<UserInfo?> getUserInfo() async {
    final storage = new FlutterSecureStorage();
    final user = await storage.read(key: 'userLogged');
    final Map<String, dynamic> userDecode = json.decode(user!);
    final UserInfo? userModel = UserInfo.fromJson(userDecode);
    return userModel;
  }

  Future<String> params(
      {int page = 1, int limit = 10, String sort = '-createdAt'}) async {
    final userInfo = await getUserInfo();

    final filter = userInfo?.apartment != null
        ? 'apartment==${userInfo!.apartment!.id}'
        : 'user==${userInfo!.user!.id}';

    return '?page=${page}&limit=${limit}&sort=${sort}&filters=${filter}';
  }

  ResidentExperience proccessPqr(
      ResidentExperience pqr, ResidentExperience comparePqr) {
    if (pqr.id == comparePqr.id) return comparePqr;
    return pqr;
  }

  ResidentExperienceBloc({required this.residentExperienceRepo})
      : super(ResidentExperienceInitial()) {
    //Carga nuevos PQR o refresca la lista de PQRs
    on<LoadResidentExperiences>((event, emit) async {
      if (state.isLoadingPqrs) return;

      late int page;

      //Valida si no es un refresh de la lista, que no haya llegado a la ultima pagina
      if (event.refresh) {
        emit(state.clearData());
        page = 1;
      } else {
        page = state.pagination?.page ?? 0;
        int? lastPage = state.pagination?.lastPage ?? 1;
        page += 1;

        if (page > lastPage) return;
      }

      final params = await this.params(page: page, limit: state.limit);

      try {
        emit(state.copyWith(isLoadingPqrs: true));

        final response = await this
            .residentExperienceRepo
            .getResidentExperience(event.context, params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final residentExperiencesResp =
              ResidentExperiencesResponse.fromJson(response.body);
          final pqrs = residentExperiencesResp.data;

          final Pagination? pagination =
              Pagination.fromJson(residentExperiencesResp.page.toMap());

          emit(state.copyWith(
            page: page,
            pqrs: event.refresh ? pqrs : [...state.pqrs, ...pqrs],
            pagination: pagination,
          ));
        }
      } catch (e) {
        print(e);
      } finally {
        emit(state.copyWith(isLoadingPqrs: false));
      }
    });

    //Carga nuevos tipos de PQR o refresca la lista de tipos de PQRs
    on<LoadPqrTypes>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingTypesPqr: true));
        final response =
            await this.residentExperienceRepo.getPqrTypes(event.context);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final typePqrResponse = TypePqrResponse.fromJson(response.body);
          final pqrTypes = typePqrResponse.data;

          emit(state.copyWith(pqrTypes: pqrTypes));
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isLoadingTypesPqr: false));
      }
    });

    //Carga nuevos categorias de PQR o refresca la lista de categorias de PQRs
    on<LoadPqrCategories>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingCategoriesPqr: true));
        final response =
            await this.residentExperienceRepo.getPqrCategories(event.context);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final typePqrResponse = CategoryPqrResponse.fromJson(response.body);
          final pqrCategories = typePqrResponse.data;

          emit(state.copyWith(pqrCategories: pqrCategories));
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isLoadingCategoriesPqr: false));
      }
    });

    // cambia el indice del TabBar a mostrar
    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(indexTab: event.index));
    });

    //Agrega un nuevo PQR a la lista actual
    on<CreatePQR>((event, emit) async {
      try {
        emit(state.copyWith(isSaving: true));

        final response = await this
            .residentExperienceRepo
            .savePQR(event.context, params: event.params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final residentExperience = ResidentExperience.fromJson(response.body);

          final newPQRs = [
            residentExperience,
            ...state.pqrs,
          ];

          final Pagination? pagination = state.pagination!
              .rebuild((b) => b..total = (b.total! + 1).toInt());

          emit(state.copyWith(pqrs: newPQRs, pagination: pagination));
          NotificationService.showAlert(event.context,
              child: event.successFullyAlert);
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });

    //edita un PQR
    on<UpdatePQR>((event, emit) async {
      try {
        emit(state.copyWith(isSaving: true));
        final response = await this
            .residentExperienceRepo
            .updatePQR(event.context, id: event.id, params: event.params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final residentExperience = ResidentExperience.fromJson(response.body);

          final prqs = state.pqrs;
          final List<ResidentExperience> newPQRS =
              prqs.map((pqr) => proccessPqr(pqr, residentExperience)).toList();
          emit(state.copyWith(pqrs: newPQRS));
          NotificationService.showAlert(event.context,
              child: event.successFullyAlert);
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(isSaving: false));
      }
    });

    //Puntua un PQR
    on<RatePQR>((event, emit) async {
      try {
        if (state.processingScore != 0) return;

        emit(state.copyWith(processingScore: event.score));

        final params = {'score': event.score.toString()};

        final response = await this
            .residentExperienceRepo
            .ratePQR(event.context, id: event.id, params: params);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final residentExperience = ResidentExperience.fromJson(response.body);

          final prqs = state.pqrs;
          final List<ResidentExperience> newPQRS =
              prqs.map((pqr) => proccessPqr(pqr, residentExperience)).toList();
          emit(state.copyWith(pqrs: newPQRS, responsePQR: ()=> residentExperience));
        }
      } catch (e) {
      } finally {
        emit(state.copyWith(processingScore: 0));
      }
    });

    //Agrega un PQR de respuesta al estado
    on<SetResponsePQRById>((event, emit) async {
      try {
        isMounted = true;
        emit(state.copyWith(responsePQR: ()=> null));
      
        final response = await this
            .residentExperienceRepo
            .getResidentExperienceById(event.context, event.id);

        if (response != null && response.statusCode == 403) {
          emit(state.copyWith(authorized: false));
        }

        if (response != null) {
          final residentExperience = ResidentExperience.fromJson(response.body);  
           emit(state.copyWith(responsePQR: () => residentExperience));
           print('El id de la respuesta en el estado es: ${state.responsePQR?.id}');
        }
      } catch (e) {
      }
    });

    //Agrega un PQR de respuesta al estado
    on<SetResponsePQR>((event, emit) {
      emit(state.copyWith(responsePQR: ()=> event.pqr));
      
    });

    //Agrega un PQR al formulario para editarlo
    on<SetEditingPQR>((event, emit) {
      emit(state.copyWith(editingPQR: ()=> event.pqr));
      add(ChangeIndex(1));
    });

    //Remueve el PQR que se va a editar del estado
    on<UnsetEditingPQR>((event, emit) async {
      emit(state.copyWith(editingPQR: () => null));
    });

    //Elimina un PQR
    on<DeletePQR>((event, emit) async {
      emit(state.copyWith(deletingId: event.id));
      final response =
          await this.residentExperienceRepo.deletePqr(event.context, event.id);
      if (response != null) {
        final newPqrs =
            state.pqrs.where((element) => element.id != event.id).toList();
        final Pagination? pagination = state.pagination!.rebuild(
          (b) => b..total = (b.total! - 1).toInt(),
        );
        emit(state.copyWith(
            pqrs: newPqrs, pagination: pagination, deletingId: ''));
      }
    });
  }
}
