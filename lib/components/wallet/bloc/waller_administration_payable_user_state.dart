part of 'waller_administration_payable_user_bloc.dart';

class WallerAdministrationPayableUserState {
  // Screen navigation params
  bool isLoadingPayment = false;
  bool isFinishPayment = false;
  Map<dynamic, dynamic> finalResponse = {"msg": "", "success": false};
  String currentScreen = "init";
  final bool isVerifyPayment;

  WallerAdministrationPayableUserState({
    this.finalResponse = const <String, dynamic>{"msg": "", "success": false},
    this.currentScreen = "init",
    this.isVerifyPayment = false,
    this.isLoadingPayment = false,
    this.isFinishPayment = false,
  });

  WallerAdministrationPayableUserState copyWith({
    bool? isVerifyPayment,
    bool? isLoadingPayment,
    bool? isFinishPayment,
    String? currentScreen,
    Map<dynamic, dynamic>? finalResponse,
  }) =>
      WallerAdministrationPayableUserState(
        isVerifyPayment: isVerifyPayment ?? this.isVerifyPayment,
        isLoadingPayment: isLoadingPayment ?? this.isLoadingPayment,
        isFinishPayment: isFinishPayment ?? this.isFinishPayment,
        finalResponse: finalResponse ?? this.finalResponse,
        currentScreen: currentScreen ?? this.currentScreen,
      );
}

class WallerAdministrationPayableUserInitial
    extends WallerAdministrationPayableUserState {}
