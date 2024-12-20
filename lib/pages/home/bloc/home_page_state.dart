import 'package:e_learning_klass/common/entities/statistical_dashboard.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final DashboardEntity dashboardData;

  HomePageLoaded(this.dashboardData);

  @override
  List<Object?> get props => [dashboardData];
}

class HomePageError extends HomePageState {
  final String error;

  HomePageError(this.error);

  @override
  List<Object?> get props => [error];
}
