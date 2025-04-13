import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  SignupFormBloc() : super(SignupFormInitial()) {
    on<SignupFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
