part of 'formpet_bloc.dart';

@immutable
abstract class FormpetEvent {}

class LoadTypes extends FormpetEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeType extends FormpetEvent {
  final String typeName;
  ChangeType(this.typeName);
}

class ChangeName extends FormpetEvent {
  final String name;
  ChangeName(this.name);
}

class ChangeRace extends FormpetEvent {
  final String race;
  ChangeRace(this.race);
}

class ChangeColor extends FormpetEvent {
  final String color;
  ChangeColor(this.color);
}

class ChangeDate extends FormpetEvent {
  final String birthDate;
  ChangeDate(this.birthDate);
}

class ChangeVaccinated extends FormpetEvent {
  final bool vaccinated;
  ChangeVaccinated(this.vaccinated);
}

class ChangeImage extends FormpetEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetForm extends FormpetEvent {
  final BuildContext context;
  ResetForm(this.context);
}

class EditPet extends FormpetEvent {
  final BuildContext context;
  final Pet pet;
  EditPet(this.context, this.pet);
}

class ChangeLoading extends FormpetEvent {
  final bool isLoading;
  ChangeLoading(this.isLoading);
}