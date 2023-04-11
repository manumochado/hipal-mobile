part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ChangeEmail extends LoginEvent {
  final String email;
  ChangeEmail(this.email);
}

class ChangePassword extends LoginEvent {
  final String password;
  ChangePassword(this.password);
}

class ResetForm extends LoginEvent {
  final String email;
  final String password;
  ResetForm(this.email, this.password);
}

class ChangeStep extends LoginEvent {
  final String step;
  ChangeStep(this.step);
}

class ChangeProfile extends LoginEvent {
  final String profile;
  ChangeProfile(this.profile);
}

class ChangeProfilesRadio extends LoginEvent{
  final List<dynamic> profiles;
  ChangeProfilesRadio(this.profiles);
}

class ChangeObscureText extends LoginEvent {
  final bool obscureText;
  ChangeObscureText(this.obscureText);
}

class ChangeLoading extends LoginEvent {
  final bool loading;
  ChangeLoading(this.loading);
}