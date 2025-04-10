part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class AuthSignupEvent extends AuthEvent {
  const AuthSignupEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password, name];
}

class AuthLogoutEvent extends AuthEvent {}
