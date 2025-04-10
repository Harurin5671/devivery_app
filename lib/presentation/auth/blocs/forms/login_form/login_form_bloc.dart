import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<LoginEmailChangedEvent>(_onLoginEmailChanged);
    on<LoginPasswordChangedEvent>(_onLoginPasswordChanged);
    on<LoginTogglePasswordVisibilityEvent>(_onLoginTogglePasswordVisibilityChanged);
    on<LoginToggleRememberMeEvent>(_onLoginToggleRememberMeChanged);
  }

  void _onLoginEmailChanged(LoginEmailChangedEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChanged(LoginPasswordChangedEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginTogglePasswordVisibilityChanged(LoginTogglePasswordVisibilityEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _onLoginToggleRememberMeChanged(LoginToggleRememberMeEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

}
