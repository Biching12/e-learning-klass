part of 'exam_overview_bloc.dart';

sealed class ExamOverviewState extends Equatable {
  const ExamOverviewState();
  
  @override
  List<Object> get props => [];
}

final class ExamOverviewInitial extends ExamOverviewState {}
