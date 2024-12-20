import 'package:e_learning_klass/common/apis/statistical_dashboard_api.dart';
import 'package:e_learning_klass/pages/home/bloc/home_page_event.dart';
import 'package:e_learning_klass/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(
      FetchDashboardData event, Emitter<HomePageState> emit) async {
    emit(HomePageLoading());

    try {
      final dashboardData = await DashboardAPI.dashboardData();
      emit(HomePageLoaded(dashboardData));
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }
}
