import 'package:equatable/equatable.dart';

abstract class ExamLessonState extends Equatable {
  const ExamLessonState();

  @override
  List<Object?> get props => [];
}

// Trạng thái ban đầu
class ExamLessonInitial extends ExamLessonState {}
