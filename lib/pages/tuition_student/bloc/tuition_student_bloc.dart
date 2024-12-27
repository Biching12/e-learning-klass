import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tuition_student_event.dart';
part 'tuition_student_state.dart';

class TuitionStudentBloc
    extends Bloc<TuitionStudentEvent, TuitionStudentState> {
  TuitionStudentBloc() : super(TuitionStudentInitial()) {
    on<TuitionStudentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
