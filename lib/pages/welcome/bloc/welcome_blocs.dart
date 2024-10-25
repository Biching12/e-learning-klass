import 'package:e_learning_klass/pages/welcome/bloc/welcome_states.dart';
import 'package:e_learning_klass/pages/welcome/bloc/welcone_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelconeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelconeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
