part of 'formvisit_bloc.dart';

@immutable
abstract class FormvisitEvent {}

class LoadTypes extends FormvisitEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormvisitEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeHour extends FormvisitEvent {
  final String hour;
  ChangeHour(this.hour);
}

class ChangeDate extends FormvisitEvent {
  final String date;
  ChangeDate(this.date);
}

class ChangeFullName extends FormvisitEvent {
  final String fullName;
  ChangeFullName(this.fullName);
}

class ChangeIdentity extends FormvisitEvent {
  final String identity;
  ChangeIdentity(this.identity);
}

class ChangeImage extends FormvisitEvent {
  final String image;
  ChangeImage(this.image);
}

class ChangeNumberPeople extends FormvisitEvent {
  final int NumberPeople;
  ChangeNumberPeople(this.NumberPeople);
}

class ChangeTypeVisit extends FormvisitEvent {
  final String typeVisit;
  ChangeTypeVisit(this.typeVisit);
}

class ChangeTypeArrival extends FormvisitEvent {
  final String typeArrival;
  ChangeTypeArrival(this.typeArrival);
}

class ChangeColor extends FormvisitEvent {
  final String color;
  ChangeColor(this.color);
}

class ChangeMark extends FormvisitEvent {
  final String mark;
  ChangeMark(this.mark);
}

class ChangeDriverName extends FormvisitEvent {
  final String driverName;
  ChangeDriverName(this.driverName);
}

class ChangePlate extends FormvisitEvent {
  final String licensePlate;
  ChangePlate(this.licensePlate);
}

class ResetForm extends FormvisitEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class EditVisit extends FormvisitEvent {
  final BuildContext context;
  final Visit visit;
  EditVisit(this.context, this.visit);
}

class ChangeLoading extends FormvisitEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}