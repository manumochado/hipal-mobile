part of 'provider_bloc.dart';

@immutable
abstract class ProviderEvent {}

class LoadProvider extends ProviderEvent {
  final BuildContext context;
  final String? providerId;
  LoadProvider(this.context, this.providerId);
}
