// import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//reusable text widget
Widget buildText(String text,
    {Color color = AppColors.primaryText,
    int size = 14,
    int right = 30,
    FontWeight fontweight = FontWeight.normal}) {
  return Container(
    margin: EdgeInsets.only(right: right.w),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: size.sp, fontWeight: fontweight),
    ),
  );
}

Widget addStudentDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.w),
    ),
    backgroundColor: AppColors.primaryBackground,
    title: buildText(
      "Thêm học sinh",
      color: AppColors.primarySecondaryElementText,
      fontweight: FontWeight.bold,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        baseTextField(),
        SizedBox(height: 12.h),
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: AppColors.primarySecondaryElement,
          foregroundColor: AppColors.primaryBackground,
          shape: const RoundedRectangleBorder(),
        ),
        child: const Text('Ok'),
      ),
    ],
  );
}
