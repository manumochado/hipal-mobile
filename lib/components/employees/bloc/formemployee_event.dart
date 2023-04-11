part of 'formemployee_bloc.dart';

@immutable
abstract class FormemployeeEvent {}

class ChangeName extends FormemployeeEvent {
  final String name;
  ChangeName(this.name);
}

class ChangeIdentity extends FormemployeeEvent {
  final String identity;
  ChangeIdentity(this.identity);
}

class ChangePhone extends FormemployeeEvent {
  final String phone;
  ChangePhone(this.phone);
}

class ChangeImage extends FormemployeeEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormemployeeEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class EditEmployee extends FormemployeeEvent {
  final BuildContext context;
  final Employee employee;
  EditEmployee(this.context, this.employee);
}

class ChangeLoadingEmployee extends FormemployeeEvent {
  final bool isLoadingEmployee;
  ChangeLoadingEmployee(this.isLoadingEmployee);
}