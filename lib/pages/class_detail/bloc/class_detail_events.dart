import 'package:equatable/equatable.dart';

abstract class ClassDetailEvents extends Equatable {
  const ClassDetailEvents();

  @override
  List<Object?> get props => [];
}

class FetchClassDetail extends ClassDetailEvents {
  final int classroomId;

  const FetchClassDetail(this.classroomId);
}
