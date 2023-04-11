part of 'formpower_bloc.dart';

@immutable
abstract class FormpowerEvent {}

class ChangePowerName extends FormpowerEvent {
  final String name;
  ChangePowerName(this.name);
}

class ChangeIdentity extends FormpowerEvent {
  final String identity;
  ChangeIdentity(this.identity);
}

class ChangeEmail extends FormpowerEvent {
  final String email;
  ChangeEmail(this.email);
}

class ChangeAssembly extends FormpowerEvent {
  final String assembly;
  ChangeAssembly(this.assembly);
}

class ResetFormPower extends FormpowerEvent {
  final BuildContext context;
  ResetFormPower(this.context);
}

class EditPower extends FormpowerEvent {
  final BuildContext context;
  final PowerAssembly powerAssembly;
  EditPower(this.context, this.powerAssembly);
}

class ChangeLoadingPower extends FormpowerEvent {
  final bool isLoading;
  ChangeLoadingPower(this.isLoading);
}

class SavePower extends FormpowerEvent {
  final BuildContext context;
  final Power powerAssembly;
  SavePower(this.context, this.powerAssembly);
}
