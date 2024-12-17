import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';

import 'package:e_learning_klass/pages/class_detail/widgets/class_detail_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({super.key});

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildAppBar(context),
        drawer: const BaseNavBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                imageAndLessonTitle("11/10: Không có nội dung"),
                classInfor("English 10", "Nguyễn Minh Phương", "10"),
                attandanceInforToday("có học"),
                classScheduleInfo("Lịch học", "Chủ nhật: 16:00 - 18:00",
                    "Thứ hai : 16:00 - 18:00", "Thứ ba: 16:00 - 18:00"),
                lessonDetail("Tiết dạy", "T3, 11 - Thg 10",
                    "Buổi 1: Không có nội dung", "11/10 | 16:00 - 18:00",
                    onPressed1: () {}, onPressed2: () {}),
                studentList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
