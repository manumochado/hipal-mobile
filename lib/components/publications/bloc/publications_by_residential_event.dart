part of 'publications_by_residential_bloc.dart';

@immutable
abstract class PublicationsByResidentialEvent {}

class LoadPublicationsByResidential extends PublicationsByResidentialEvent {
  final BuildContext context;
  LoadPublicationsByResidential(this.context);
}

class LoadMorePublicationsByResidential extends PublicationsByResidentialEvent {
  final BuildContext context;
  LoadMorePublicationsByResidential(this.context);
}

class LoadRefreshPublicationsByResidential
    extends PublicationsByResidentialEvent {
  final BuildContext context;
  LoadRefreshPublicationsByResidential(this.context);
}
