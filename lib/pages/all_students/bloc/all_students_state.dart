import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:equatable/equatable.dart';

abstract class AllStudentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllStudentsInitial extends AllStudentsState {}

class AllStudentsLoading extends AllStudentsState {}

class AllStudentsLoaded extends AllStudentsState {
  final AllStudentsResponseEntity allStudentsResponse;

  AllStudentsLoaded(this.allStudentsResponse);

  @override
  List<Object?> get props => [allStudentsResponse];
}

class AllStudentsError extends AllStudentsState {
  final String error;

  AllStudentsError(this.error);

  @override
  List<Object?> get props => [error];
}
