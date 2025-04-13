import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/domain/domain.dart';
import 'package:delivery/presentation/presentation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocationService locationService;
  final LocationBloc locationBloc;

  AuthBloc({required this.locationService, required this.locationBloc})
    : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthSignupEvent>(_onSignup);
    on<AuthLogoutEvent>(_onLogout);
  }
  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    locationBloc.add(CheckLocationStatusEvent());
    try {
      final email = event.email;
      final password = event.password;
      if (email.isEmpty || password.isEmpty) {
        emit(AuthFailure('Please fill all the fields'));
        return;
      }
      if (locationBloc.state is LocationPermissionDenied) {
        emit(AuthPermissionRequired());
        return;
      }
      if (locationBloc.state is LocationPermissionGranted) {
        locationBloc.add(CheckLocationStatusEvent());
        locationBloc.add(GetLocationEvent());
        emit(AuthAuthenticated());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignup(AuthSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {} catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {} catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
