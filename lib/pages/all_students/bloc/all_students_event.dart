import 'package:equatable/equatable.dart';

abstract class AllStudentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAllStudentsEvent extends AllStudentsEvent {}
