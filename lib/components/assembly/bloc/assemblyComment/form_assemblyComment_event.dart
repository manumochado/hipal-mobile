part of 'form_assemblyComment_bloc.dart';

@immutable
abstract class FormcommentEvent {}

class LoadTypes extends FormcommentEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeMessage extends FormcommentEvent {
  final String message;
  ChangeMessage(this.message);
}

class ResetForm extends FormcommentEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class ChangeLoading extends FormcommentEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}
