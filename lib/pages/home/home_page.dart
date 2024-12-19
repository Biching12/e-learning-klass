import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_title.dart';

import 'package:e_learning_klass/common/widgets/information_class_card.dart';
import 'package:e_learning_klass/common/widgets/line_and_text.dart';
import 'package:e_learning_klass/pages/home/widgets/home_page_widgets.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                baseTitle("Thông tin chung"),
                lineAndText(
                    "Chạm vào số sẽ chuyển hướng tới màn hình tương ứng!"),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.allStudents);
                      },
                      child: buildInfoCard(
                          '35',
                          'Tổng học sinh',
                          const Icon(
                            FluentIcons.people_16_regular,
                            color: AppColors.iconColorElement,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.allTeachers);
                      },
                      child: buildInfoCard(
                          '4',
                          'Giáo viên',
                          const Icon(
                            FluentIcons.hat_graduation_16_regular,
                            color: AppColors.iconColorSecondElement,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.allClasses);
                      },
                      child: buildInfoCard(
                          '3',
                          'Tổng số lớp học',
                          const Icon(
                            FluentIcons.conference_room_16_regular,
                            color: Color.fromARGB(255, 21, 141, 201),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.classToday);
                      },
                      child: buildInfoCard(
                          '1',
                          'Lớp hôm nay',
                          const Icon(
                            Icons.schedule,
                            color: Color.fromARGB(255, 231, 78, 93),
                          )),
                    ),
                  ],
                ),
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
                baseTitle("Học sinh vắng hôm nay (6)"),
                slidersViewStudend(
                  context,
                  List.generate(12, (index) => 'Dương Quốc Minh'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
