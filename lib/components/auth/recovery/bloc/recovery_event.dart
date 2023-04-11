part of 'recovery_bloc.dart';

@immutable
abstract class RecoveryEvent {}

class ChangeStep extends RecoveryEvent {
  final String step;
  ChangeStep(this.step);
}

class ChangeEmailOrPhone extends RecoveryEvent {
  final String emailOrPhone;
  ChangeEmailOrPhone(this.emailOrPhone);
}

class ChangeType extends RecoveryEvent {
  final String type;
  ChangeType(this.type);
}

class ChangeFieldsHidden extends RecoveryEvent {
  final String emailHidden;
  final String phoneHidden;
  ChangeFieldsHidden(this.emailHidden, this.phoneHidden);
}

class ChangeCode extends RecoveryEvent {
  final String code;
  ChangeCode(this.code);
}

class ChangePassword extends RecoveryEvent {
  final String password;
  ChangePassword(this.password);
}

class ChangeObscureText extends RecoveryEvent {
  final bool obscureText;
  ChangeObscureText(this.obscureText);
}

class ChangePasswordConfirm extends RecoveryEvent {
  final String passwordConfirm;
  ChangePasswordConfirm(this.passwordConfirm);
}

class ChangeObscureTextConfirm extends RecoveryEvent {
  final bool obscureTextConfirm;
  ChangeObscureTextConfirm(this.obscureTextConfirm);
}

class ChangeLoading extends RecoveryEvent {
  final bool loading;
  ChangeLoading(this.loading);
}

class ChangeLoadingSendCodeAgain extends RecoveryEvent {
  final bool loading;
  ChangeLoadingSendCodeAgain(this.loading);
}
