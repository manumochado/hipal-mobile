part of 'form_service_bloc.dart';

@immutable
abstract class FormServiceEvent {}

class ChangeType extends FormServiceEvent {
  final String type;
  ChangeType(this.type);
}

class ChangeProvider extends FormServiceEvent {
  final String provider;
  ChangeProvider(this.provider);
}

class ChangeContract extends FormServiceEvent {
  final String Contract;
  ChangeContract(this.Contract);
}

class ChangeImage extends FormServiceEvent {
  final String image;
  ChangeImage(this.image);
}


