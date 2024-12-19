import 'package:e_learning_klass/common/entities/classes.dart';
import 'package:equatable/equatable.dart';

abstract class ClassesEvents extends Equatable {
  const ClassesEvents();

  @override
  List<Object?> get props => [];
}

// Event to get classroom list
class FetchClassroomList extends ClassesEvents {
  const FetchClassroomList();
}

// Event when clasroom list loaded successfull
class ClassroomListLoaded extends ClassesEvents {
  final List<ClassroomDataEntity> classrooms;

  const ClassroomListLoaded(this.classrooms);

  @override
  List<Object?> get props => [classrooms];
}
