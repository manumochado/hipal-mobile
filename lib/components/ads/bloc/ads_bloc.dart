import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:hipal/serializers/pagination.dart';

import '../model/ad.dart';
import '../repository/ads_repository.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository adsRepo;

  params(int page) {
    return "?state=true&page=${page}&limit=10";
  }

  loadMore(response, emit, {bool refresh = false}) async {
    emit(state.copyWith(ads: null));

    final adsResponse = json.decode(response.body);
    final List<Ads>? ads = adsResponse['data']
        .map<Ads>((json) => Ads.fromJson(json))
        .toList() as List<Ads>;

    ads!.forEach((element) {
      print("element ${element.description}");
    });

    final Pagination? pagination = Pagination.fromJson(adsResponse['page']);
    final newads = refresh
        ? ads
        : [
            ...?state.ads,
            ...ads,
          ];
    print("load ads ${adsResponse}");
    if (state.page + 1 > state.page)
      return emit(state.copyWith(ads: newads, pagination: pagination));
  }

  AdsBloc({required this.adsRepo}) : super(AdsInitial()) {
    on<LoadAds>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params = this.params(state.page);

      try {
        emit(state.copyWith(isInitLoading: true));
        final response = await this.adsRepo.getAds(event.context, params);
        if (response != null && response.statusCode == 200) {
          this.loadMore(response, emit, refresh: true);
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isInitLoading: false));
      }
    });

    on<LoadRefreshAds>((event, emit) async {
      emit(state.copyWith(page: 1));
      final String params = this.params(state.page);
      try {
        emit(state.copyWith(isRefreshLoading: true));
        final response = await this.adsRepo.getAds(event.context, params);
        if (response != null && response.statusCode == 200) {
          this.loadMore(response, emit, refresh: true);
        }
      } catch (e) {
        print(e);
      } finally {
        emit(state.copyWith(isRefreshLoading: false));
      }
    });

    on<LoadMoreAds>((event, emit) async {
      emit(state.copyWith(page: state.page + 1));
      final String params = this.params(state.page);

      try {
        emit(state.copyWith(isMoreLoading: true));
        final response = await this.adsRepo.getAds(event.context, params);
        if (response != null && response.statusCode == 200)
          this.loadMore(response, emit);
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isMoreLoading: false));
      }
    });

    on<getAdsById>((event, emit) async {
      emit(state.copyWith(adById: null));

      try {
        emit(state.copyWith(isLoadingadById: true));
        final response =
            await this.adsRepo.getAdsById(event.context, event.idAds);
        if (response != null && response.statusCode == 200) {
          final adsResponse = json.decode(response.body);
          final Ads ad = Ads.fromJson(adsResponse);
          emit(state.copyWith(adById: ad));
        }
      } catch (err) {
        print(err);
      } finally {
        emit(state.copyWith(isLoadingadById: false));
      }
    });
  }
}
