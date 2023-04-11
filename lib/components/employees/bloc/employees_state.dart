part of 'employees_bloc.dart';

@immutable
class EmployeesState {
  final bool isInit;

  final String title;
  final Pagination? pagination;
  final List<Employee>? employees;
  
  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final String s;

  const EmployeesState({
    this.isInit = false,
    this.title = 'Empleados',
    this.pagination,
    this.employees,
    this.page = 1,
    this.limit = 10,
    this.s = "",
    this.indexTab = 0,
  });

  EmployeesState copyWith({
    bool? isInit,
    String? title,
    Pagination? pagination,
    List<Employee>? employees,
    int? page,
    int? limit,
    String? s,
    int? indexTab,
  }) => EmployeesState(
    isInit: isInit ?? this.isInit,
    title: title ?? this.title,
    pagination: pagination ?? this.pagination,
    employees: employees ?? this.employees,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    s: s ?? this.s,
    indexTab: indexTab ?? this.indexTab,
  );
}

class EmployeesInitial extends EmployeesState {}
