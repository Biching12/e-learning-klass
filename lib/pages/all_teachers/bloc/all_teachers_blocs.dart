import 'package:e_learning_klass/pages/all_teachers/bloc/all_teachers_events.dart';
import 'package:e_learning_klass/pages/all_teachers/bloc/all_teachers_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTeachersBlocs extends Bloc<AllTeachersEvents, AllTeachersStates> {
  AllTeachersBlocs() : super(const AllTeachersStates()) {
    return;
  }
}
