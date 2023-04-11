import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

import 'package:hipal/components/employees/repository/employees_repository.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'formemployee_event.dart';
part 'formemployee_state.dart';

class FormemployeeBloc extends Bloc<FormemployeeEvent, FormemployeeState> {
  final EmployeesRepository employeesRepo;

  Employee proccessData(String field, value){
    final Employee newEmployee;

    if(state.employee!=null){
      final Map<String,dynamic> objectEmployee = json.decode(json.encode(state.employee!.toJson()));
      objectEmployee[field] = value;
      newEmployee = Employee.fromJson(objectEmployee)!;
    }else{
      Map<String, dynamic> employee = { field: value };
      newEmployee = Employee.fromJson(employee)!;
    }

    return newEmployee;
  }

  FormemployeeBloc({required this.employeesRepo}) : super(FormemployeeInitial()) {
    on<ChangeName>((event, emit) async {
      final Employee newEmployee = this.proccessData( "name", event.name );
      emit( state.copyWith( employee: newEmployee ));
    });

    on<ChangePhone>((event, emit) async {
      final Employee newEmployee = this.proccessData( "phone", event.phone );
      emit( state.copyWith( employee: newEmployee ));
    });

    on<ChangeIdentity>((event, emit) async {
      final Employee newEmployee = this.proccessData( "identity", event.identity );
      emit( state.copyWith( employee: newEmployee ));
    });

    on<ChangeImage>((event, emit) async {
      emit( state.copyWith( image: event.image ));
    });

    on<ResetForm>((event, emit) async {
      Employee newEmployee = Employee.fromJson({}) as Employee;
      print(newEmployee);
      emit( state.copyWith( image: '', employee: newEmployee, id: '' ));
    });

    on<EditEmployee>((event, emit) async {
      emit( state.copyWith( image: '', employee: event.employee, id: event.employee.id ));
    });

    on<ChangeLoadingEmployee>((event, emit) async {
      emit( state.copyWith( isLoadingEmployee: event.isLoadingEmployee ));
    });

  }
}
