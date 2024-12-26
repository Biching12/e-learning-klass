import 'package:e_learning_klass/pages/exam_lesson/bloc/exam_lesson_event.dart';
import 'package:e_learning_klass/pages/exam_lesson/bloc/exam_lesson_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamLessonBloc extends Bloc<ExamLessonEvent, ExamLessonState> {
  ExamLessonBloc() : super(ExamLessonInitial()) {}
}
