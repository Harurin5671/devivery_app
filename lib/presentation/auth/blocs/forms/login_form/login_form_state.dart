part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = '',
    this.password = '',
    this.showPassword = false,
    this.rememberMe = false,
  });

  final String email;
  final String password;
  final bool showPassword;
  final bool rememberMe;

  bool get isEmailValid =>
      RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? showPassword,
    bool? rememberMe,
  })
  {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    showPassword,
    rememberMe,
  ];
}
