import 'package:e_learning_klass/common/apis/class_detail_api.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_events.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassDetailBlocs extends Bloc<ClassDetailEvents, ClassDetailStates> {
  ClassDetailBlocs() : super(ClassDetailInitial()) {
    on<FetchClassDetail>(_onFetchClassDetail);
  }

  Future<void> _onFetchClassDetail(
      FetchClassDetail event, Emitter<ClassDetailStates> emit) async {
    try {
      emit(ClassDetailLoading());
      final classDetail =
          await ClassroomDetailAPI.getClassroomDetail(event.classroomId);
      emit(ClassDetailLoaded(classDetail));
    } catch (e) {
      emit(ClassDetailError("Failed to load class detail: ${e.toString()}"));
    }
  }
}
