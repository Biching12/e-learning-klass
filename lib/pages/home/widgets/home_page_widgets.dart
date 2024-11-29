import 'package:e_learning_klass/common/values/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//reusable title widget
Widget homePageTitle(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.bold),
    ),
  );
}

//reusable subtitle widget
Widget homePageText(String text,
    {Color colorText = AppColors.primaryThirdElementText,
    int top = 10,
    Color color = AppColors.primarySecondaryElement}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 4,
            color: color,
            margin: EdgeInsets.only(right: 8.w),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: colorText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

// view all grid view page
Widget allHomePageGridView(context) {
  return GridView.count(
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
        child: _buildInfoCard(
            '35',
            'Tổng học sinh',
            const Icon(
              FluentIcons.people_16_regular,
              color: AppColors.iconColorElement,
            )),
      ),
      _buildInfoCard(
          '4',
          'Giáo viên',
          const Icon(
            FluentIcons.hat_graduation_16_regular,
            color: Color.fromARGB(255, 233, 211, 47),
          )),
      _buildInfoCard(
          '3',
          'Tổng số lớp học',
          const Icon(
            FluentIcons.conference_room_16_regular,
            color: Color.fromARGB(255, 21, 141, 201),
          )),
      _buildInfoCard(
          '10',
          'Lớp hôm nay',
          const Icon(
            Icons.schedule,
            color: Color.fromARGB(255, 231, 78, 93),
          )),
    ],
  );
}

// information card for all view page
Widget _buildInfoCard(String number, String label, Icon icon) {
  return Container(
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryFourthElementText),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryThirdElementText),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 4.w,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
      ],
    ),
  );
}

// infor class card
Widget buildInfoClassCard(
    String title, String teacher, String teacherTwo, String time) {
  return Container(
    width: 360.w,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: AppColors.primarySecondaryElement,
      border: Border.all(color: AppColors.primaryFourthElementText),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryElementText),
        ),
        Text(
          "GV: $teacher",
          style:
              TextStyle(fontSize: 13.sp, color: AppColors.primaryElementText),
        ),
        Text(
          "ĐG 1: $teacherTwo",
          style:
              TextStyle(fontSize: 13.sp, color: AppColors.primaryElementText),
        ),
        Text(
          time,
          style:
              TextStyle(fontSize: 13.sp, color: AppColors.primaryElementText),
        ),
      ],
    ),
  );
}

//for slider view student not attandance
Widget slidersViewStudend(BuildContext context, List<String> students) {
  return Container(
    height: 120.h,
    padding: EdgeInsets.all(16.w),
    child: PageView.builder(
        itemCount: (students.length),
        itemBuilder: (context, pageIndex) {
          // Items for the current page
          final pageItems = students.skip(pageIndex * 6).take(6).toList();
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: pageItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Icon(Icons.person,
                      size: 40, color: AppColors.primarySecondaryElement),
                  Text(
                    pageItems[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ],
              );
            },
          );
        }),
  );
}
