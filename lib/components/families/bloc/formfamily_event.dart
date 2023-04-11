part of 'formfamily_bloc.dart';

@immutable
abstract class FormfamilyEvent {}

class LoadTypes extends FormfamilyEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormfamilyEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeName extends FormfamilyEvent {
  final String name;
  ChangeName(this.name);
}

class ChangeIdentity extends FormfamilyEvent {
  final String identity;
  ChangeIdentity(this.identity);
}

class ChangeEmail extends FormfamilyEvent {
  final String email;
  ChangeEmail(this.email);
}

class ChangePhone extends FormfamilyEvent {
  final String phone;
  ChangePhone(this.phone);
}

class ChangeGender extends FormfamilyEvent {
  final String gender;
  ChangeGender(this.gender);
}

class ChangeBirthDate extends FormfamilyEvent {
  final String birthDate;
  ChangeBirthDate(this.birthDate);
}

class ChangeImage extends FormfamilyEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormfamilyEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class EditFamily extends FormfamilyEvent {
  final BuildContext context;
  final Family family;
  EditFamily(this.context, this.family);
}

class ChangeLoading extends FormfamilyEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}