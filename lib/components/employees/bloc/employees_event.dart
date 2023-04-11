part of 'employees_bloc.dart';

@immutable
abstract class EmployeesEvent {}

class InitEmployees extends EmployeesEvent {
  final BuildContext context;
  InitEmployees(this.context);
}

class LoadEmployees extends EmployeesEvent {
  final BuildContext context;
  LoadEmployees(this.context);
}

class LoadRefreshEmployees extends EmployeesEvent {
  final BuildContext context;
  LoadRefreshEmployees(this.context);
}

class LoadMoreEmployees extends EmployeesEvent {
  final BuildContext context;
  LoadMoreEmployees(this.context);
}

class ChangeIndex extends EmployeesEvent {
  final int index;
  ChangeIndex(this.index);
}

class DeleteEmployee extends EmployeesEvent {
  final BuildContext context;
  final String id;
  DeleteEmployee(this.context, this.id);
}

class LoadNewEmployee extends EmployeesEvent {
  final Employee employee;
  LoadNewEmployee(this.employee);
}

class LoadEditEmployee extends EmployeesEvent {
  final Employee employee;
  LoadEditEmployee(this.employee);
}