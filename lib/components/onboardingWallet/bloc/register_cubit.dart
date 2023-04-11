import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/MunResponse.dart';
import '../model/cityResponse.dart';
import '../repository/onboarding_register_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final OnboardingRegisterRepository registerRepository;
  RegisterCubit({required this.registerRepository})
      : super(const RegisterState());

  void stepChanged() {
    emit(state.copyWith(step: state.step + 1));
  }

  //Type document page
  void typeDocChanged(String type) {
    emit(state.copyWith(typeDoc: type));
  }

  //Type document page
  void typeDocAddedAllData(
    String type,
    String noDoc,
    String fechaExpCed,
    bool infHipal,
    bool infDing,
  ) {
    emit(state.copyWith(
        typeDoc: type,
        fechaExpCed: fechaExpCed,
        infDing: infDing,
        infHipal: infHipal));
  }

  void addedInformationProfile(String name, String lastname, String dateNac,
      String genero, String email, String city, String mun, String address) {
    emit(state.copyWith(
        name: name,
        lastname: lastname,
        dateNac: dateNac,
        genero: genero,
        email: email,
        city: city,
        state: mun,
        address: address));
  }

  void addedPhone(String phone) {
    emit(state.copyWith(numberPhone: phone));
  }

  //Get States
  Future loadState(BuildContext context) async {
    final response = await this.registerRepository.getCity(context);
    if (response != null && response.statusCode == 200) {
      emit(state.copyWith(stateList: cityResponseFromJson(response.body)));
    }
  }

  //Get Mun
  Future loadMun(BuildContext context, String code) async {
    emit(state.copyWith(munList: []));
    final response = await this.registerRepository.getMun(context, code);
    if (response != null && response.statusCode == 200) {
      emit(state.copyWith(munList: munResponseFromJson(response.body)));
    }
  }

  //Send OTP
  Future sendOTPCode(BuildContext context) async {
    emit(state.copyWith(munList: []));
    final response = await this
        .registerRepository
        .sendOTPCode(context, {"phone_number": state.numberPhone});
    if (response != null && response.statusCode == 201) {}
  }
}
