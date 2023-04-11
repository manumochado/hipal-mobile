part of 'formaddressdelivery_bloc.dart';

@immutable
abstract class FormAddressdeliveryEvent {}

class LoadTypes extends FormAddressdeliveryEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormAddressdeliveryEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeName extends FormAddressdeliveryEvent {
  final String name;
  ChangeName(this.name);
}


class ChangeDescription extends FormAddressdeliveryEvent {
  final String description;
  ChangeDescription(this.description);
}

class ChangeImage extends FormAddressdeliveryEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormAddressdeliveryEvent {
  final BuildContext context;
  ResetForm(this.context);
}


class ChangeLoading extends FormAddressdeliveryEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}