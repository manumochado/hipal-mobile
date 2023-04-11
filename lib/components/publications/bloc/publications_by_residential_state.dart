part of 'publications_by_residential_bloc.dart';

@immutable
class PublicationsByResidentialState {
  final Pagination? pagination;
  final List<PublicationInListByResidential> publications;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const PublicationsByResidentialState({
    this.pagination,
    required this.publications,
    this.page = 1,
    this.limit = 10,
    this.s = "",
  });

  PublicationsByResidentialState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<PublicationInListByResidential>? publications,
    int? page,
    int? limit,
    String? s,
  }) =>
      PublicationsByResidentialState(
        pagination: pagination ?? this.pagination,
        publications: publications ?? this.publications,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
      );
}

class PublicationsInitial extends PublicationsByResidentialState {
  PublicationsInitial(
      {required List<PublicationInListByResidential> publications})
      : super(publications: publications);
}
