import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_icon.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/common/widgets/devider_line.dart';
import 'package:e_learning_klass/common/widgets/image_and_text.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_bloc.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_event.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_state.dart';

import 'package:e_learning_klass/pages/all_students/widgets/all_students_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  @override
  void initState() {
    super.initState();
    context.read<AllStudentsBloc>().add(FetchAllStudentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildAppBar(context),
        drawer: const BaseNavBar(),
        body: BlocBuilder<AllStudentsBloc, AllStudentsState>(
            builder: (context, state) {
          if (state is AllStudentsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllStudentsLoaded) {
            final students = state.allStudentsResponse.data.items;
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 25.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildText("20",
                              color: AppColors.primarySecondaryElementText),
                          buildText("All",
                              color: AppColors.primarySecondaryElementText,
                              right: 140),
                          baseIcon(const Icon(Icons.filter_list)),
                          baseIcon(const Icon(Icons.abc_sharp)),
                          baseIcon(const Icon(Icons.more_vert), left: 0),
                        ],
                      ),
                    ],
                  ),
                ),
                dividerLine(),
                Expanded(
                  // Ensure the ListView takes up available vertical space
                  child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return imageAndText(context,
                          avatarUrl: student.avatarUrl,
                          fullName: student.fullName,
                          absent: student.id.toString());
                    },
                  ),
                )
              ],
            );
          } else if (state is AllStudentsError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('No data available.'));
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => addStudentDialog(context),
            );
          },
          backgroundColor: AppColors.primarySecondaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Make it circular
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.primaryBackground,
          ),
        ),
      ),
    );
  }
}
