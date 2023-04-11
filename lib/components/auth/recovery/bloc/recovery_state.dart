part of 'recovery_bloc.dart';

@immutable
class RecoveryState {
  final String step;

  // Email or Phone and Validation
  final String emailOrPhone;
  bool get isValidEmailorPhone =>
      new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(emailOrPhone) ||
              new RegExp(r'^((\d{10})|(\d{13}))$').hasMatch(emailOrPhone)
          ? true
          : false;

  final String type;

  final Map<String, dynamic> hiddenFields;

  final String code;

  // Password, Validation and ObscureText
  final String password;
  bool get isValidPassword => password.length >= 6;
  final bool obscureText;
  bool get isObscureText => obscureText ? true : false;

  final String passwordConfirm;
  bool get isValidPasswordConfirm => passwordConfirm.length >= 6;
  final bool obscureTextConfirm;
  bool get isObscureTextConfirm => obscureTextConfirm ? true : false;

  // Form is Loading
  final bool loading;
  final bool loadingSendCodeAgain;

  bool get isLoading => loading ? true : false;
  bool get isLoadingSendCodeAgain => loadingSendCodeAgain ? true : false;

  const RecoveryState({
    this.step = 'email',
    this.emailOrPhone = '',
    this.type = 'email',
    this.hiddenFields = const {'email': '', 'phone': ''},
    this.code = '',
    this.password = '',
    this.obscureText = true,
    this.passwordConfirm = '',
    this.obscureTextConfirm = true,
    this.loading = false,
    this.loadingSendCodeAgain = false,
  });

  RecoveryState copyWith({
    String? step,
    String? emailOrPhone,
    String? type,
    Map<String, dynamic>? hiddenFields,
    String? code,
    String? password,
    bool? obscureText,
    String? passwordConfirm,
    bool? obscureTextConfirm,
    bool? loading,
    bool? loadingSendCodeAgain,
  }) =>
      RecoveryState(
        step: step ?? this.step,
        emailOrPhone: emailOrPhone ?? this.emailOrPhone,
        type: type ?? this.type,
        hiddenFields: hiddenFields ?? this.hiddenFields,
        code: code ?? this.code,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        obscureTextConfirm: obscureTextConfirm ?? this.obscureTextConfirm,
        loading: loading ?? this.loading,
        loadingSendCodeAgain: loadingSendCodeAgain ?? this.loadingSendCodeAgain,
      );
}

class RecoveryInitial extends RecoveryState {
  const RecoveryInitial()
      : super(
          step: 'email',
          emailOrPhone: '',
          type: 'email',
          hiddenFields: const {'email': '', 'phone': ''},
          code: '',
          password: '',
          obscureText: true,
          passwordConfirm: '',
          obscureTextConfirm: true,
          loading: false,
        );
}
