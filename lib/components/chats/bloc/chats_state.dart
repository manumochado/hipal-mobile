part of 'chats_bloc.dart';

@immutable
class ChatsState {
  final bool isInitSocket;
  final int notView;

  final Pagination? pagination;
  final List<ChatResponse>? chats;
  final bool loadingToogle;
  final bool toogle;
  final bool isLoadingChats;
  final bool isLoadingRefresh;
  final bool isLoadingMore;
  // Search Params
  final int page;
  final int limit;
  final String s;
  final int selection;
  final String apartament;

  const ChatsState({
    this.apartament = '',
    this.toogle = false,
    this.isLoadingChats = false,
    this.isLoadingRefresh = false,
    this.isLoadingMore = false,
    this.loadingToogle = false,
    this.isInitSocket = false,
    this.notView = 0,
    this.pagination,
    this.chats,
    this.page = 0,
    this.limit = 10,
    this.s = "",
    this.selection = 0,
  });

  ChatsState copyWith({
    String? apartament,
    bool? toogle,
    bool? isLoadingChats,
    bool? isLoadingRefresh,
    bool? isLoadingMore,
    bool? loadingToogle,
    bool? isInitSocket,
    int? notView,
    Pagination? pagination,
    List<ChatResponse>? chats,
    int? page,
    int? limit,
    String? s,
    int? selection,
  }) =>
      ChatsState(
        apartament: apartament ?? this.apartament,
        toogle: toogle ?? this.toogle,
        isLoadingChats: isLoadingChats ?? this.isLoadingChats,
        isLoadingRefresh: isLoadingRefresh ?? this.isLoadingRefresh,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        loadingToogle: loadingToogle ?? this.loadingToogle,
        isInitSocket: isInitSocket ?? this.isInitSocket,
        notView: notView ?? this.notView,
        pagination: pagination ?? this.pagination,
        chats: chats ?? this.chats,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        selection: selection ?? this.selection,
      );
}

class ChatsInitial extends ChatsState {}
