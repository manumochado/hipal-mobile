import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/publications/model/provider.dart';
import 'package:hipal/components/publications/repository/provider_repository.dart';

part 'provider_state.dart';
part 'provider_event.dart';

class ProviderBloc extends Bloc<ProviderEvent, Providerstate> {
  final ProviderRepository providerRepo;

  ProviderBloc({required this.providerRepo}) : super(ProviderInitial()) {
    on<LoadProvider>((event, emit) async {
      final response =
          await this.providerRepo.getProvider(event.context, event.providerId);

      final providerResponseDecode = json.decode(response);

      print("providerResponseDecode $providerResponseDecode");

      final Provider? provider = Provider.fromJson(providerResponseDecode);

      emit(state.copyWith(
        id: provider?.id,
        createdAt: provider?.createdAt,
        updatedAt: provider?.updatedAt,
        img: provider?.img,
        infoContract: provider?.infoContract,
        isEnabled: provider?.isEnabled,
        responsable: provider?.responsable,
        user: provider?.user,
        company: provider?.company,
        v: provider?.v,
      ));
    });
  }
}
