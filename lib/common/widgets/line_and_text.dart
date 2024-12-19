import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget lineAndText(String text,
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
