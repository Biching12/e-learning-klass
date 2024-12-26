import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exam_overview_event.dart';
part 'exam_overview_state.dart';

class ExamOverviewBloc extends Bloc<ExamOverviewEvent, ExamOverviewState> {
  ExamOverviewBloc() : super(ExamOverviewInitial()) {
    on<ExamOverviewEvent>((event, emit) {});
  }
}
