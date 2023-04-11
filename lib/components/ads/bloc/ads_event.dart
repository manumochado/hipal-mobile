part of 'ads_bloc.dart';

@immutable
abstract class AdsEvent {}

class InitAds extends AdsEvent {
  final BuildContext context;
  InitAds(this.context);
}

class LoadAds extends AdsEvent {
  final BuildContext context;
  LoadAds(this.context);
}

class LoadRefreshAds extends AdsEvent {
  final BuildContext context;
  LoadRefreshAds(this.context);
}

class LoadMoreAds extends AdsEvent {
  final BuildContext context;
  LoadMoreAds(this.context);
}

class DeleteAd extends AdsEvent {
  final BuildContext context;
  final String id;
  DeleteAd(this.context, this.id);
}

class LoadNewAd extends AdsEvent {
  final Ads ad;
  LoadNewAd(this.ad);
}

class LoadEditAd extends AdsEvent {
  final Ads ad;
  LoadEditAd(this.ad);
}

class getAdsById extends AdsEvent {
  final BuildContext context;
  final String idAds;
  getAdsById(this.context, this.idAds);
}

class resetAdById extends AdsEvent {
  final BuildContext context;
  resetAdById(this.context);
}
