import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/components/employees/model/employee.dart';

import 'package:hipal/components/employees/repository/employees_repository.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final EmployeesRepository employeesRepo;

  params( String search, String page, String limit, String startId ){
    return "?s="+state.s+"&page="+page+"&limit="+state.limit.toString()+"&startId="+startId;
  }

  loadMore( response, emit){
    final employeesResponse = json.decode(response.body);
    print(employeesResponse);
    final List<Employee> employees = employeesResponse['data'].map((e) => Employee.fromJson(e)).toList().cast<Employee>();
    print("--------------------- Pagination ${employeesResponse['page']}");
    final Pagination? pagination = Pagination.fromJson(employeesResponse['page']);
    final newEmployees = [
      ...?state.employees,
      ...employees,
    ];
    emit( state.copyWith(employees: newEmployees, pagination: pagination) );
  }

  Employee proccessEmployee( employee, compareEmployee ){
    if(employee.id == compareEmployee.employee.id)
      return compareEmployee.employee;
    return employee;
  }

  EmployeesBloc({required this.employeesRepo}) : super(EmployeesInitial()) {
    on<LoadEmployees>((event, emit) async {
      final String params = this.params(state.s,state.page.toString(),state.limit.toString(), '');

      final response = await this.employeesRepo.getEmployees(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<LoadRefreshEmployees>((event, emit) async {
      emit( state.copyWith(page: 1 ) );
      final String params = this.params(state.s,"1",state.limit.toString(), '');

      final response = await this.employeesRepo.getEmployees(event.context, params);
      if( response!=null && response.statusCode == 200 ){
        final employeesResponse = json.decode(response.body);
        final List<Employee> employees = employeesResponse['data'].map((e) => Employee.fromJson(e)).toList().cast<Employee>();
        final Pagination? pagination = Pagination.fromJson(employeesResponse['page']);
        emit( state.copyWith(employees: employees, pagination: pagination) );
      }
    });

    on<LoadMoreEmployees>((event, emit) async {
      final String params = this.params(state.s,"",state.limit.toString(), state.employees!.last.id.toString());

      final response = await this.employeesRepo.getEmployees(event.context, params);
      if( response!=null && response.statusCode == 200 )
        this.loadMore(response, emit);
    });

    on<DeleteEmployee>((event, emit) async {
      final response = await this.employeesRepo.deleteEmployee(event.context, event.id);
      print(response.statusCode);
      if( response!=null && response.statusCode == 200 ){
        final employees = [...?state.employees, ];
        final List<Employee> newEmployees = employees.where((element) => element.id != event.id ).toList().cast<Employee>();

        final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!-1).toInt() );
        emit( state.copyWith( employees: newEmployees, pagination: pagination ) );
      }
    });

    on<LoadNewEmployee>((event, emit) async {
      print(event.employee);
      final newEmployees = [ event.employee,...?state.employees, ];
      final Pagination? pagination = state.pagination!.rebuild((b) => b..total = (b.total!+1).toInt() );
      emit( state.copyWith( employees: newEmployees, pagination: pagination ) );
    });

    on<LoadEditEmployee>((event, emit) async {
      final employees = [...?state.employees, ];
      final List<Employee> newEmployees = employees.map((employee) => proccessEmployee(employee,event) ).toList().cast();      
      emit( state.copyWith(employees: newEmployees) );
    });

    on<ChangeIndex>((event, emit) async {
      emit( state.copyWith( indexTab: event.index ) );
    });
  }
}
