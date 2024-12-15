// infor class card
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget _buidText(String text,
    {Color color = AppColors.primaryElementText,
    double size = 13,
    FontWeight fontweight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size.sp,
      fontWeight: fontweight,
      color: color,
    ),
  );
}

Widget buildInfoClassCard(
    String title, String teacher, String studentCount, String time,
    {int? boder}) {
  return Container(
    width: 360.w,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: AppColors.primarySecondaryElement,
      border: Border.all(color: AppColors.primaryFourthElementText),
      borderRadius: (boder != null)
          ? const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))
          : BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buidText(title, size: 20, fontweight: FontWeight.bold),
        _buidText("GV: $teacher"),
        SizedBox(
          height: 12.h,
        ),
        _buidText("Sĩ số: $studentCount", fontweight: FontWeight.bold),
        _buidText(time),
      ],
    ),
  );
}
