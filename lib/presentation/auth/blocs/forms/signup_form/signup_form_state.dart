part of 'signup_form_bloc.dart';

sealed class SignupFormState extends Equatable {
  const SignupFormState();
  
  @override
  List<Object> get props => [];
}

final class SignupFormInitial extends SignupFormState {}
