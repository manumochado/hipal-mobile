part of 'streamings_bloc.dart';

@immutable
class StreamingsState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Streaming>? streamings;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const StreamingsState({
    this.isInit = false,
    this.title = 'Streaming',
    this.pagination,
    this.streamings,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  StreamingsState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Streaming>? streamings,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => StreamingsState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    streamings: streamings ?? this.streamings,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class StremaingsInitial extends StreamingsState {}
