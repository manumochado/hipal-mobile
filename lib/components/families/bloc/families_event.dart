part of 'families_bloc.dart';

@immutable
abstract class FamiliesEvent {}

class InitFamilies extends FamiliesEvent {
  final BuildContext context;
  InitFamilies(this.context);
}

class LoadFamilies extends FamiliesEvent {
  final BuildContext context;
  LoadFamilies(this.context);
}

class LoadRefreshFamilies extends FamiliesEvent {
  final BuildContext context;
  LoadRefreshFamilies(this.context);
}

class LoadMoreFamilies extends FamiliesEvent {
  final BuildContext context;
  LoadMoreFamilies(this.context);
}

class ChangeIndex extends FamiliesEvent {
  final int index;
  ChangeIndex(this.index);
}

class DeleteFamily extends FamiliesEvent {
  final BuildContext context;
  final String id;
  DeleteFamily(this.context, this.id);
}

class LoadNewFamily extends FamiliesEvent {
  final Family family;
  LoadNewFamily(this.family);
}

class LoadEditFamily extends FamiliesEvent {
  final Family family;
  LoadEditFamily(this.family);
}