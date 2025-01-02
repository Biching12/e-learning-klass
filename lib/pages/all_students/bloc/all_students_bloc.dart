import 'package:e_learning_klass/common/apis/student_api.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_event.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllStudentsBloc extends Bloc<AllStudentsEvent, AllStudentsState> {
  AllStudentsBloc() : super(AllStudentsInitial()) {
    on<FetchAllStudentsEvent>(_onFetchAllStudents);
  }
  Future<void> _onFetchAllStudents(
      FetchAllStudentsEvent event, Emitter<AllStudentsState> emit) async {
    emit(AllStudentsLoading());
    try {
      final response = await StudentAPI.getAllStudents();
      emit(AllStudentsLoaded(response));
    } catch (e) {
      emit(AllStudentsError(e.toString()));
    }
  }
}
