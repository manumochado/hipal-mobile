import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:hipal/components/auth/login/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepo;

  LoginBloc({required this.loginRepo}) : super(const LoginInitial()) {

    on<ChangeEmail>((event, emit) {
      emit( state.copyWith(email: event.email) );
    });

    on<ResetForm>((event, emit) {
      emit( state.copyWith(email: "", password: "") );
    });

    on<ChangePassword>((event, emit) {
      emit( state.copyWith(password: event.password) );
    });

    on<ChangeStep>((event, emit) {
      emit( state.copyWith(step: event.step) );
    });
    
    on<ChangeObscureText>((event, emit) {
      emit( state.copyWith(obscureText: event.obscureText) );
    });

    on<ChangeProfile>((event, emit) {
      emit( state.copyWith(profile: event.profile) );
    });
    
    on<ChangeProfilesRadio>((event, emit) {
      emit( state.copyWith(radioProfilesButton: event.profiles) );
    });

    on<ChangeLoading>((event, emit) {
      emit( state.copyWith(loading: event.loading) );
    });
  }
}
