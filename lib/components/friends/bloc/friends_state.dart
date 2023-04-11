part of 'friends_bloc.dart';

@immutable
class FriendsState {
  final List<Friends>? listFriends;
  final int limit;
  final String searchText;
  final int page;
  final Pagination? pagination;
  final bool isLoading;
  final bool openForm;

  const FriendsState({
    this.openForm = false,
    this.listFriends,
    this.searchText = '',
    this.limit = 10,
    this.page = 1,
    this.pagination,
    this.isLoading = false,
  });

  FriendsState copyWith({
    bool? openForm,
    String? searchText,
    List<Friends>? listFriends,
    int? limit,
    int? page,
    Pagination? pagination,
    bool? isLoading,
  }) =>
      FriendsState(
        openForm: openForm ?? this.openForm,
        listFriends: listFriends ?? this.listFriends,
        searchText: searchText ?? this.searchText,
        limit: limit ?? this.limit,
        page: page ?? this.page,
        pagination: pagination ?? this.pagination,
        isLoading: isLoading ?? this.isLoading,
      );
}

class FriendsInitial extends FriendsState {}
