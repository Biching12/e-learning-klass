import 'package:e_learning_klass/pages/sign_in/bloc/signin_events.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  SignInBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
