import 'package:e_learning_klass/common/apis/classes_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'classes_events.dart';
import 'classes_states.dart';

class ClassesBlocs extends Bloc<ClassesEvents, ClassesStates> {
  ClassesBlocs() : super(ClassesInitial()) {
    on<FetchClassroomList>(_onFetchClassroomList);
  }

  Future<void> _onFetchClassroomList(
      FetchClassroomList event, Emitter<ClassesStates> emit) async {
    try {
      emit(ClassesLoading()); // Emit trạng thái loading

      // Gọi API lấy danh sách lớp học
      final response = await ClassroomAPI.classroomList();

      // Emit trạng thái Loaded khi thành công
      emit(ClassesLoaded(response.items));
    } catch (e) {
      // Emit trạng thái Error nếu có lỗi
      emit(ClassesError("Failed to load classrooms: $e"));
    }
  }
}
