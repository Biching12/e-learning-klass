import 'package:e_learning_klass/pages/school_schedule/bloc/school_schedule_events.dart';
import 'package:e_learning_klass/pages/school_schedule/bloc/school_schedule_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolScheduleBlocs
    extends Bloc<SchoolScheduleEvents, SchoolScheduleStates> {
  SchoolScheduleBlocs() : super(const SchoolScheduleStates()) {
    return;
  }
}
