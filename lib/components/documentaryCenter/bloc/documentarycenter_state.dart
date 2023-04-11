part of 'documentarycenter_bloc.dart';

@immutable
class DocumentarycenterState {

  final bool isInit;
  final String title;
  final Pagination? pagination;
  final int page;
  final int limit;
  final List<DocumentaryCenter>? documents;
  final String searchText;

  const DocumentarycenterState({
    this.isInit = false,
    this.title = 'Centro Documental',
    this.pagination,
    this.page = 1,
    this.limit = 10,
    this.documents,
    this.searchText = '',
  });

  DocumentarycenterState copyWith({
    bool? isInit,
    String? title,
    String? typeName,
    Pagination? pagination,
    int? page,
    int? limit,
    List<DocumentaryCenter>? documents,
    String? searchText,

  }) => DocumentarycenterState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    documents: documents ?? this.documents,
    searchText: searchText ?? this.searchText,
  );

}

class DocumentarycenterInitial extends DocumentarycenterState {}
