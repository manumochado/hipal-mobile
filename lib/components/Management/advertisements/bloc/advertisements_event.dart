part of 'advertisements_bloc.dart';

@immutable
abstract class AdvertisementsEvent {}

class LoadAdvertisements extends AdvertisementsEvent {
  final BuildContext context;
  LoadAdvertisements(this.context);
}
class LoadRefreshAdvertisements extends AdvertisementsEvent {
  final BuildContext context;
  LoadRefreshAdvertisements(this.context);
}
class searchAdvertisements extends AdvertisementsEvent {
  final BuildContext context;
  final String searchText;
  searchAdvertisements(this.context, this.searchText);
}

