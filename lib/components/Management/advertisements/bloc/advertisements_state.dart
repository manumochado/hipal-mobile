part of 'advertisements_bloc.dart';

@immutable
class AdvertisementsState {

  final List<Advertisements>? advertisements;
  final String searchText;
  final String searchResidentialText;
  
  const AdvertisementsState({
    this.advertisements,
    this.searchText = '',
    this.searchResidentialText = '',
  });
  AdvertisementsState copyWith({
    List<Advertisements>? advertisements,
    String? searchText,
    String? searchResidentialText,
  }) => AdvertisementsState(
    searchText: searchText ?? this.searchText,
    advertisements: advertisements ?? this.advertisements,
    searchResidentialText: searchResidentialText ?? this.searchResidentialText,
  );
}

class AdvertisementsInitial extends AdvertisementsState {}
