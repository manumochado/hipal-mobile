part of 'login_bloc.dart';

@immutable
class LoginState {
  // Step Email or Select Profile
  final String step;

  // Email and Validation
  final String email;
  bool get isValidEmail => new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(email) ? true : false;

  // Password, Validation and ObscureText
  final String password;
  bool get isValidPassword => password.length >= 6;
  final bool obscureText;
  bool get isObscureText => obscureText ? true : false;

  // Profile
  final String profile;
  // Profiles
  final List radioProfilesButton;
  
  // Form is Loading
  final bool loading;
  bool get isLoading => loading ? true : false;

  const LoginState({
    this.step = 'email',
    this.email = '',
    this.password = '',
    this.profile = '',
    this.obscureText = true,
    this.loading = false,
    this.radioProfilesButton = const []
  });

  LoginState copyWith({
    String? step,
    String? email,
    String? password,
    String? profile,
    bool? obscureText,
    bool? loading,
    List<dynamic>? radioProfilesButton
  }) => LoginState(
    step: step ?? this.step,
    email: email ?? this.email,
    password: password ?? this.password,
    profile: profile ?? this.profile,
    obscureText: obscureText ?? this.obscureText,
    loading: loading ?? this.loading,
    radioProfilesButton: radioProfilesButton ?? this.radioProfilesButton,
  );
}

class LoginInitial extends LoginState {
  const LoginInitial(): super(
    step: 'email',
    email: '',
    password: '',
    profile: '',
    obscureText: true,
    loading: false,
    radioProfilesButton: const []
  );
}