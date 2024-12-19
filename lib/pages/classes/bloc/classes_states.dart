import 'package:equatable/equatable.dart';
import 'package:e_learning_klass/common/entities/entities.dart';

abstract class ClassesStates extends Equatable {
  const ClassesStates();

  @override
  List<Object?> get props => [];
}

// Trạng thái ban đầu
class ClassesInitial extends ClassesStates {}

// Trạng thái đang tải dữ liệu
class ClassesLoading extends ClassesStates {}

// Trạng thái dữ liệu được tải thành công
class ClassesLoaded extends ClassesStates {
  final List<ClassroomDataEntity> classrooms;

  const ClassesLoaded(this.classrooms);

  @override
  List<Object?> get props => [classrooms];
}

// Trạng thái xảy ra lỗi
class ClassesError extends ClassesStates {
  final String error;
  const ClassesError(this.error);

  @override
  List<Object?> get props => [error];
}
