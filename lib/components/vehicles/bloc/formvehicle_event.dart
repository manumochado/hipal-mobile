part of 'formvehicle_bloc.dart';

@immutable
abstract class FormvehicleEvent {}

class LoadTypes extends FormvehicleEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormvehicleEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeColor extends FormvehicleEvent {
  final String color;
  ChangeColor(this.color);
}

class ChangeYear extends FormvehicleEvent {
  final int year;
  ChangeYear(this.year);
}

class ChangePlate extends FormvehicleEvent {
  final String plate;
  ChangePlate(this.plate);
}

class ChangeModel extends FormvehicleEvent {
  final String model;
  ChangeModel(this.model);
}

class ChangeMark extends FormvehicleEvent {
  final String mark;
  ChangeMark(this.mark);
}

class ChangeImage extends FormvehicleEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormvehicleEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class EditVehicle extends FormvehicleEvent {
  final BuildContext context;
  final Vehicle vehicle;
  EditVehicle(this.context, this.vehicle);
}

class ChangeLoading extends FormvehicleEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}