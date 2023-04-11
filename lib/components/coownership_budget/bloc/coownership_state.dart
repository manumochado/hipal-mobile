part of 'coownership_bloc.dart';

@immutable
class CoownershipState {

  final List<CoownershipBudget>? listCoownershipBudget;
  final Pagination? pagination;
  final int page;
  final int limit;
  final String fromScreen;

  const CoownershipState({
    this.listCoownershipBudget,
    this.pagination,
    this.page = 1,
    this.limit = 10,
    this.fromScreen = "dashboard",
  });

  CoownershipState copyWith({
    List<CoownershipBudget>? listCoownershipBudget,
    Pagination? pagination,
    int? page,
    int? limit,
    String? fromScreen,

  }) => CoownershipState(
    listCoownershipBudget: listCoownershipBudget ?? this.listCoownershipBudget,
    pagination: pagination ?? this.pagination,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    fromScreen: fromScreen ?? this.fromScreen,
  );

}

class CoownershipInitial extends CoownershipState {}
