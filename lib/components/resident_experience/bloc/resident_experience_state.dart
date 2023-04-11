part of 'resident_experience_bloc.dart';

@immutable
class ResidentExperienceState {
  final bool isLoadingPqrs;
  final bool isLoadingPqrTypes;
  final bool isLoadingPqrCategories;
  final bool isSaving;
  final int processingScore;
  final String title;
  final Pagination? pagination;
  final List<ResidentExperience> pqrs;
  final int page;
  final int limit;
  final int? indexTab;
  final ResidentExperience? editingPQR;
  final ResidentExperience? responsePQR;
  final bool authorized;
  final String deletingId;
  final List<TypePQR>? pqrTypes;
  final List<CategoryPQR>? pqrCategories;

  const ResidentExperienceState({
    this.authorized = true,
    this.isLoadingPqrs = false,
    this.isLoadingPqrTypes = false,
    this.isLoadingPqrCategories = false,
    this.isSaving = false,
    this.processingScore = 0,
    this.title = 'Experiencia del residente',
    this.pagination,
    this.pqrs = const [],
    this.page = 1,
    this.limit = 10,
    this.indexTab = 0,
    this.editingPQR,
    this.responsePQR,
    this.deletingId = '',
    this.pqrTypes = const [],
    this.pqrCategories = const [],
  });

  ResidentExperienceState copyWith(
          {bool? authorized,
          bool? isLoadingPqrs,
          bool? isLoadingTypesPqr,
          bool? isLoadingCategoriesPqr,
          bool? isSaving,
          int? processingScore,
          String? title,
          Pagination? pagination,
          List<ResidentExperience>? pqrs,
          int? page,
          int? limit,
          int? indexTab,
          ResidentExperience? Function()? editingPQR,
          ResidentExperience? Function()? responsePQR,
          String? deletingId,
          List<TypePQR>? pqrTypes,
          List<CategoryPQR>? pqrCategories}) =>
      ResidentExperienceState(
        authorized: authorized ?? this.authorized,
        isLoadingPqrs: isLoadingPqrs ?? this.isLoadingPqrs,
        isLoadingPqrTypes: isLoadingTypesPqr ?? this.isLoadingPqrTypes,
        isLoadingPqrCategories: isLoadingCategoriesPqr ?? this.isLoadingPqrCategories,
        isSaving: isSaving ?? this.isSaving,
        processingScore: processingScore ?? this.processingScore,
        title: title ?? this.title,
        pagination: pagination ?? this.pagination,
        pqrs: pqrs ?? this.pqrs,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        indexTab: indexTab ?? this.indexTab,
        editingPQR: editingPQR != null ? editingPQR() : this.editingPQR,
        responsePQR: responsePQR != null ? responsePQR() : this.responsePQR,
        deletingId: deletingId ?? this.deletingId,
        pqrTypes: pqrTypes ?? this.pqrTypes,
        pqrCategories: pqrCategories ?? this.pqrCategories,
      ); 

  ResidentExperienceState clearData() => ResidentExperienceState();
}

class ResidentExperienceInitial extends ResidentExperienceState {}
