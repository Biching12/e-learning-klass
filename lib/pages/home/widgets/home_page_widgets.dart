import 'package:e_learning_klass/common/values/colors.dart';

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

// information card for all view page
Widget buildInfoCard(String number, String label, Icon icon) {
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
              fontSize: 45.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primarySecondaryElementText),
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
