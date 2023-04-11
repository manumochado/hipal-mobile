part of 'directory_bloc.dart';

@immutable
class DirectoryState {
  final String title;
  final String searchText;
  final String searchResidentialText;
  final Pagination? pagination;
  final Pagination? paginationResidential;
  final List<DirectoryEmergency>? listDirectoryEmergency;
  final List<DirectoryResidential>? listDirectoryResidential;
  final int? indexTab;
  // Search Params
  final int page;
  final int pageResidential;
  final int limit;
  final String s;

  const DirectoryState({
    this.title = 'Directorio',
    this.searchText = '',
    this.searchResidentialText = '',
    this.pagination,
    this.paginationResidential,
    this.listDirectoryEmergency,
    this.listDirectoryResidential,
    this.page = 1,
    this.pageResidential = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  DirectoryState copyWith({
    String? title,
    String? searchText,
    String? searchResidentialText,
    Pagination? pagination,
    Pagination? paginationResidential,
    List<DirectoryEmergency>? listDirectoryEmergency,
    List<DirectoryResidential>? listDirectoryResidential,
    int? page,
    int? pageResidential,
    int? limit,
    String? s,
    int? indexTab,
  }) => DirectoryState(
    title: title ?? this.title,
    searchText: searchText ?? this.searchText,
    searchResidentialText: searchResidentialText ?? this.searchResidentialText,
    pagination: pagination ?? this.pagination,
    paginationResidential: paginationResidential ?? this.paginationResidential,
    listDirectoryEmergency: listDirectoryEmergency ?? this.listDirectoryEmergency,
    listDirectoryResidential: listDirectoryResidential ?? this.listDirectoryResidential,
    page: page ?? this.page,
    pageResidential: pageResidential ?? this.pageResidential,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );

}



class DirectoryInitial extends DirectoryState {}
