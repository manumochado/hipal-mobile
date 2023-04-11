part of 'publication_bloc.dart';

@immutable
abstract class PublicationEvent {}

class LoadPublication extends PublicationEvent {
  final BuildContext context;
  final String publicationId;
  LoadPublication(this.context, this.publicationId);
}

class LoadPublicationsByProvider extends PublicationEvent {
  final BuildContext context;
  final String? providerId;
  final String publicationId;
  LoadPublicationsByProvider(this.context, this.providerId, this.publicationId);
}

class LoadMorePublications extends PublicationEvent {
  final BuildContext context;
  final String? providerId;
  final String publicationId;
  LoadMorePublications(this.context, this.providerId, this.publicationId);
}

class LoadRefreshPublications extends PublicationEvent {
  final BuildContext context;
  final String? providerId;
  final String publicationId;
  LoadRefreshPublications(this.context, this.providerId, this.publicationId);
}
