import 'package:e_learning_klass/pages/class_today/bloc/class_today_events.dart';
import 'package:e_learning_klass/pages/class_today/bloc/class_today_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassTodayBlocs extends Bloc<ClassTodayEvents, ClassTodayStates> {
  ClassTodayBlocs() : super(const ClassTodayStates()) {}
}
