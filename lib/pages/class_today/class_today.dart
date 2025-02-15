import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/common/widgets/base_title.dart';
import 'package:e_learning_klass/common/widgets/information_class_card.dart';
import 'package:e_learning_klass/common/widgets/line_and_text.dart';
import 'package:e_learning_klass/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassToday extends StatefulWidget {
  const ClassToday({super.key});

  @override
  State<ClassToday> createState() => _ClassTodayState();
}

class _ClassTodayState extends State<ClassToday> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildAppBar(context),
        drawer: const BaseNavBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                baseTitle("Điểm danh"),
                lineAndText("Bấm vào lớp bên dưới để điểm danh"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.classDetail);
                  },
                  child: buildInfoClassCard(
                    "English 10",
                    "Nguyễn Minh Phương",
                  ),
                ),
                lineAndText(
                    "Việc không điểm danh có thể ảnh hưởng tới tính năng tính lương và thu học phí!",
                    color: AppColors.primaryThirdElement),
                baseTitle("Học sinh vắng hôm nay (0)"),
                lineAndText(
                    "Học sinh nghỉ trong các lớp không được điểm danh, không có lý nghỉ, trong ngày"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
