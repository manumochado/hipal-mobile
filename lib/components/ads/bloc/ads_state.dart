part of 'ads_bloc.dart';

@immutable
class AdsState {
  final String title;
  final Pagination? pagination;
  final List<Ads>? ads;
  final Ads? adById;

  // Loading States
  final bool isInitLoading;
  final bool isRefreshLoading;
  final bool isMoreLoading;
  final bool isLoadingadById;

  final int? indexTab;

  // Search Params
  final int page;
  final int limit;
  final int totalRecords;
  final int totalPages;
  final String s;

  AdsState(this.ads,
      {this.adById,
      this.title = 'Anuncios',
      this.pagination,
      this.page = 1,
      this.totalRecords = 0,
      this.totalPages = 0,
      this.limit = 10,
      this.s = "",
      this.indexTab = 0,
      this.isRefreshLoading = false,
      this.isMoreLoading = false,
      this.isInitLoading = false,
      this.isLoadingadById = false});

  AdsState copyWith({
    String? title,
    Pagination? pagination,
    List<Ads>? ads,
    Ads? adById,
    int? page,
    int? totalRecords = 0,
    int? totalPages = 0,
    int? limit,
    String? s,
    int? indexTab,
    bool? isRefreshLoading,
    bool? isMoreLoading,
    bool? isInitLoading,
    bool? isLoadingadById,
  }) {
    return AdsState(ads ?? this.ads,
        adById: adById ?? this.adById,
        title: title ?? this.title,
        pagination: pagination ?? this.pagination,
        page: page ?? this.page,
        totalRecords: totalRecords ?? this.totalRecords,
        totalPages: totalPages ?? this.totalPages,
        limit: limit ?? this.limit,
        s: s ?? this.s,
        indexTab: indexTab ?? this.indexTab,
        isRefreshLoading: isRefreshLoading ?? this.isRefreshLoading,
        isMoreLoading: isMoreLoading ?? this.isMoreLoading,
        isInitLoading: isInitLoading ?? this.isInitLoading,
        isLoadingadById: isLoadingadById ?? this.isLoadingadById);
  }
}

class AdsInitial extends AdsState {
  AdsInitial() : super([]);
}
