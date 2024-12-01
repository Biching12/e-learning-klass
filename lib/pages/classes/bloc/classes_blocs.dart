import 'package:e_learning_klass/pages/classes/bloc/classes_events.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesBlocs extends Bloc<ClassesEvents, ClassesStates> {
  ClassesBlocs() : super(const ClassesStates()) {}
}
