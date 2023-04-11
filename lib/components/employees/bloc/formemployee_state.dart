part of 'formemployee_bloc.dart';

@immutable
class FormemployeeState {
  final String? id;
  final Employee? employee;
  final String? image;
  final bool isLoadingEmployee;

  const FormemployeeState({
    this.id,
    this.employee,
    this.image,
    this.isLoadingEmployee = false,
  });

  FormemployeeState copyWith({
    String? id,
    Employee? employee,
    String? image,
    bool isLoadingEmployee = false,
  }) => FormemployeeState(
    id: id ?? this.id,
    employee: employee ?? this.employee,
    image: image ?? this.image,
    isLoadingEmployee: isLoadingEmployee,
  );
}

class FormemployeeInitial extends FormemployeeState {}
