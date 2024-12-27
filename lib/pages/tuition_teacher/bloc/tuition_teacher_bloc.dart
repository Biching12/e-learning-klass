import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tuition_teacher_event.dart';
part 'tuition_teacher_state.dart';

class TuitionTeacherBloc extends Bloc<TuitionTeacherEvent, TuitionTeacherState> {
  TuitionTeacherBloc() : super(TuitionTeacherInitial()) {
    on<TuitionTeacherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
