part of 'provider_bloc.dart';

@immutable
class Providerstate {
  final String? id;
  final String? user;
  final InfoContract? infoContract;
  final Responsable? responsable;
  final Company? company;
  final bool? isEnabled;
  final String? img;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Providerstate copyWith({
    String? id,
    String? user,
    InfoContract? infoContract,
    Responsable? responsable,
    Company? company,
    bool? isEnabled,
    String? img,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Providerstate(
        id: id ?? this.id,
        user: user ?? this.user,
        infoContract: infoContract ?? this.infoContract,
        responsable: responsable ?? this.responsable,
        company: company ?? this.company,
        isEnabled: isEnabled ?? this.isEnabled,
        img: img,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Providerstate({
    this.id,
    this.user,
    this.infoContract,
    this.responsable,
    this.company,
    this.isEnabled,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}

class ProviderInitial extends Providerstate {}
