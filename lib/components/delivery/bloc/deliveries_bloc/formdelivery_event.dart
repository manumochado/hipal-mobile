part of 'formdelivery_bloc.dart';

@immutable
abstract class FormdeliveryEvent {}

class LoadTypes extends FormdeliveryEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormdeliveryEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeName extends FormdeliveryEvent {
  final String name;
  ChangeName(this.name);
}


class ChangeDescription extends FormdeliveryEvent {
  final String description;
  ChangeDescription(this.description);
}

class ChangeImage extends FormdeliveryEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormdeliveryEvent {
  final BuildContext context;
  ResetForm(this.context);
}


class ChangeLoading extends FormdeliveryEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}