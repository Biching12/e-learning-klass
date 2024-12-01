import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_events.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassDetailBlocs extends Bloc<ClassDetailEvents, ClassDetailStates> {
  ClassDetailBlocs() : super(const ClassDetailStates()) {}
}
