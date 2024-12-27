import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget baseButton(String text,
    {required VoidCallback onPressed,
    Color color = AppColors.primarySecondaryElement}) {
  return Container(
    margin: EdgeInsets.only(top: 40.h),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.w),
          side: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        backgroundColor: color,
        foregroundColor: AppColors.primaryBackground,
        shadowColor: Colors.black.withOpacity(0.1),
        elevation: 6,
        // padding: const EdgeInsets.symmetric(
        //   vertical: 8,
        //   horizontal: 50,
        // ),
      ),
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}
