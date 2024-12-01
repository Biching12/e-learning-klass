import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/common/widgets/information_class_card.dart';
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
        appBar: buildAppBar(context),
        drawer: baseNavBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageTitle("Thông tin chung"),
                homePageText(
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
                        Navigator.pushNamed(context, "/all_students");
                      },
                      child: buildInfoCard(
                          '35',
                          'Tổng học sinh',
                          const Icon(
                            FluentIcons.people_16_regular,
                            color: AppColors.iconColorElement,
                          )),
                    ),
                    buildInfoCard(
                        '4',
                        'Giáo viên',
                        const Icon(
                          FluentIcons.hat_graduation_16_regular,
                          color: AppColors.iconColorSecondElement,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/all_classes");
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
                        Navigator.pushNamed(context, "/class_today");
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
                homePageTitle("Điểm danh"),
                homePageText("Bấm vào lớp bên dưới để điểm danh"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/class_detail");
                  },
                  child: buildInfoClassCard(
                    "English 10",
                    "Nguyễn Minh Phương",
                    "Ngô Thục Anh",
                    '12',
                    "18:30 - 20:30",
                  ),
                ),
                homePageText(
                    "Việc không điểm danh có thể ảnh hưởng tới tính năng tính lương và thu học phí!",
                    color: AppColors.primaryThirdElement),
                homePageTitle("Học sinh vắng hôm nay (6)"),
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
