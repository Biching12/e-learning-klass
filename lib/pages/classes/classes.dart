import 'package:e_learning_klass/common/values/colors.dart';

import 'package:e_learning_klass/common/widgets/base_icon.dart';
import 'package:e_learning_klass/common/widgets/devider_line.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_blocs.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_events.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_states.dart';
import 'package:e_learning_klass/pages/classes/widgets/classes_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  void initState() {
    super.initState();
    // Dispatch FetchClassroomList event when screen initial
    context.read<ClassesBlocs>().add(const FetchClassroomList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: BlocBuilder<ClassesBlocs, ClassesStates>(
          builder: (context, state) {
            if (state is ClassesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ClassesLoaded) {
              // Hiển thị danh sách lớp học khi tải thành công
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                    child: ListView.builder(
                      itemCount: state.classrooms.length,
                      itemBuilder: (context, index) {
                        final classroom = state.classrooms[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/class_detail",
                                  arguments: classroom.id);
                            },
                            child: classCard(classroom));
                      },
                    ),
                  )
                ],
              );
            } else if (state is ClassesError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('No data available.'));
          },
        ),
      ),
    );
  }
}
