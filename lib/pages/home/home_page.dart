import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/pages/home/widgets/home_page_widgets.dart';
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
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homePageTitle("Thông tin chung"),
              homePageText(
                  "Chạm vào số sẽ chuyển hướng tới màn hình tương ứng!"),
              allHomePageGridView(context),
              homePageTitle("Điểm danh"),
              homePageText("Bấm vào lớp bên dưới để điểm danh"),
              buildInfoClassCard("English 10", "Nguyễn Minh Phương",
                  "Ngô Thục Anh", "18:30 - 20:30"),
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
    );
  }
}
