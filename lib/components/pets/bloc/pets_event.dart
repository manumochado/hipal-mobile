part of 'pets_bloc.dart';

@immutable
abstract class PetsEvent {}

class InitPets extends PetsEvent {
  final BuildContext context;
  InitPets(this.context);
}

class LoadPets extends PetsEvent {
  final BuildContext context;
  LoadPets(this.context);
}

class LoadRefreshPets extends PetsEvent {
  final BuildContext context;
  LoadRefreshPets(this.context);
}

class LoadMorePets extends PetsEvent {
  final BuildContext context;
  LoadMorePets(this.context);
}

class ChangeIndex extends PetsEvent {
  final int index;
  ChangeIndex(this.index);
}

class DeletePet extends PetsEvent {
  final BuildContext context;
  final String id;
  DeletePet(this.context, this.id);
}

class LoadNewPet extends PetsEvent {
  final Pet pet;
  LoadNewPet(this.pet);
}

class LoadEditPet extends PetsEvent {
  final Pet pet;
  LoadEditPet(this.pet);
}