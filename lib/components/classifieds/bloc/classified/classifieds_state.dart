part of 'classifieds_bloc.dart';

@immutable
class ClassifiedsState {
  final String title;
  final List<Classified> generalClassifieds;
  final List<Classified> userClassifieds;
  final Classified? classifiedDetail;
  final Pagination? generalPagination;
  final Pagination? userPagination;
  final int? indexTab;
  final int page;
  final int pageId;
  final int limit;
  final bool authorized;
  final bool isLoadingGeneralClassifieds;
  final bool isLoadingUserClassifieds;
  final bool isLoadingFromNotification;
  final bool isSaving;

  const ClassifiedsState({
    this.title = 'Clasificados',
    this.generalClassifieds = const [],
    this.userClassifieds = const [],
    this.classifiedDetail,
    this.generalPagination,
    this.userPagination,
    this.indexTab = 1,
    this.page = 1,
    this.pageId = 1,
    this.limit = 10,
    this.authorized = true,
    this.isLoadingGeneralClassifieds = false,
    this.isLoadingUserClassifieds = false,
    this.isLoadingFromNotification = false,
    this.isSaving = false,
  });

  ClassifiedsState copyWith({
    String? title,
    Pagination? generalPagination,
    Pagination? userPagination,
    List<Classified>? generalClassifieds,
    List<Classified>? userClassifieds,
    Classified? classifiedDetail,
    int? indexTab,
    int? page,
    int? pageId,
    int? limit,
    bool? authorized,
    bool? isLoadingGeneralClassifieds,
    bool? isLoadingUserClassifieds,
    bool? isLoadingFromNotification,
    bool? isSaving,
  }) =>
      ClassifiedsState(
        title: title ?? this.title,
        generalPagination: generalPagination ?? this.generalPagination,
        userPagination: userPagination ?? this.userPagination,
        generalClassifieds: generalClassifieds ?? this.generalClassifieds,
        userClassifieds: userClassifieds ?? this.userClassifieds,
        classifiedDetail: classifiedDetail ?? this.classifiedDetail,
        indexTab: indexTab ?? this.indexTab,
        page: page ?? this.page,
        pageId: pageId ?? this.pageId,
        limit: limit ?? this.limit,
        authorized: authorized ?? this.authorized,
        isLoadingGeneralClassifieds:
            isLoadingGeneralClassifieds ?? this.isLoadingGeneralClassifieds,
        isLoadingUserClassifieds:
            isLoadingUserClassifieds ?? this.isLoadingUserClassifieds,
        isLoadingFromNotification:
            isLoadingFromNotification ?? this.isLoadingFromNotification,
        isSaving: isSaving ?? this.isSaving,
      );

  ClassifiedsState clearData() => ClassifiedsState();
}

class ClassifiedsInitial extends ClassifiedsState {}
