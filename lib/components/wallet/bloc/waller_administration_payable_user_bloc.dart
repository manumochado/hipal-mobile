import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'waller_administration_payable_user_state.dart';

class WallerAdministrationPayableUserCubic
    extends Cubit<WallerAdministrationPayableUserState> {
  WallerAdministrationPayableUserCubic(
      WallerAdministrationPayableUserState initialState)
      : super(initialState);

  void changeToVerifyPayment(bool _state) {
    emit(state.copyWith(isVerifyPayment: _state));
  }

  void isLoadingPayment(bool _state) {
    emit(state.copyWith(isLoadingPayment: _state));
  }

  void sendFinalResponse(Map<dynamic, dynamic> response) {
    emit(state.copyWith(finalResponse: response));
  }

  void changeScreen(String screen) {
    emit(state.copyWith(currentScreen: screen));
  }
}
