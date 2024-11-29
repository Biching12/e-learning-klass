import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/application/bloc/app_events.dart';
import 'package:e_learning_klass/pages/application/bloc/app_states.dart';
import 'package:e_learning_klass/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                    width: 375.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: buildBottomNavBar(context, state.index))),
          ),
        );
      },
    );
  }
}
