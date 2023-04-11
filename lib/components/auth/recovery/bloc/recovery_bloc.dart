import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:hipal/components/auth/recovery/repository/recovery_repository.dart';

part 'recovery_event.dart';
part 'recovery_state.dart';

class RecoveryBloc extends Bloc<RecoveryEvent, RecoveryState> {
  final RecoveryRepository recoveryRepo;

  RecoveryBloc({required this.recoveryRepo}) : super(RecoveryInitial()) {
    on<ChangeStep>((event, emit) {
      emit(state.copyWith(step: event.step));
    });

    on<ChangeEmailOrPhone>((event, emit) {
      emit(state.copyWith(emailOrPhone: event.emailOrPhone));
    });

    on<ChangeType>((event, emit) {
      emit(state.copyWith(type: event.type));
    });

    on<ChangeFieldsHidden>((event, emit) {
      emit(state.copyWith(hiddenFields: {
        'email': event.emailHidden,
        'phone': event.phoneHidden,
      }));
    });

    on<ChangeCode>((event, emit) {
      emit(state.copyWith(code: event.code));
    });

    on<ChangePassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ChangeObscureText>((event, emit) {
      emit(state.copyWith(obscureText: event.obscureText));
    });

    on<ChangePasswordConfirm>((event, emit) {
      emit(state.copyWith(passwordConfirm: event.passwordConfirm));
    });

    on<ChangeObscureTextConfirm>((event, emit) {
      emit(state.copyWith(obscureTextConfirm: event.obscureTextConfirm));
    });

    on<ChangeLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });

    on<ChangeLoadingSendCodeAgain>((event, emit) {
      emit(state.copyWith(loadingSendCodeAgain: event.loading));
    });
  }
}
