import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/pages/all_students/widgets/all_students_widgets.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildText("20",
                        top: 0, color: AppColors.primarySecondaryElementText),
                    buildText("Tất cả",
                        top: 0,
                        color: AppColors.primarySecondaryElementText,
                        right: 140),
                    const Icon(Icons.filter_list),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(FluentIcons.book_letter_20_filled),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ],
            ),
          ),
          dividerLine(),
          buildListStudents([
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
            "Dương Quốc Minh",
          ]),
        ],
      ),
    );
  }
}
