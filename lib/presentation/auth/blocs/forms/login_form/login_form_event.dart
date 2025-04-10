part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class LoginEmailChangedEvent extends LoginFormEvent {
  const LoginEmailChangedEvent({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class LoginPasswordChangedEvent extends LoginFormEvent {
  const LoginPasswordChangedEvent({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class LoginTogglePasswordVisibilityEvent extends LoginFormEvent {}

class LoginToggleRememberMeEvent extends LoginFormEvent {}
