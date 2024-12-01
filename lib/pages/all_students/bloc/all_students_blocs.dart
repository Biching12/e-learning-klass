import 'package:e_learning_klass/pages/all_students/bloc/all_students_events.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllStudentsBlocs extends Bloc<AllStudentsEvents, AllStudentsStates> {
  AllStudentsBlocs() : super(const AllStudentsStates()) {}
}
