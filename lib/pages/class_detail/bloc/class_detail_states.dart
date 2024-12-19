import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:equatable/equatable.dart';

abstract class ClassDetailStates extends Equatable {
  const ClassDetailStates();

  @override
  List<Object?> get props => [];
}

class ClassDetailInitial extends ClassDetailStates {}

class ClassDetailLoading extends ClassDetailStates {}

class ClassDetailLoaded extends ClassDetailStates {
  final ClassDetailEntity classDetail;

  const ClassDetailLoaded(this.classDetail);

  @override
  List<Object?> get props => [classDetail];
}

class ClassDetailError extends ClassDetailStates {
  final String error;

  const ClassDetailError(this.error);

  @override
  List<Object?> get props => [error];
}
