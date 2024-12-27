part of 'tuition_student_bloc.dart';

sealed class TuitionStudentState extends Equatable {
  const TuitionStudentState();
  
  @override
  List<Object> get props => [];
}

final class TuitionStudentInitial extends TuitionStudentState {}
