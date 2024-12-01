// import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//reusable text widget
Widget buildText(
  String text, {
  Color color = AppColors.primaryText,
  int size = 14,
  int right = 30,
}) {
  return Container(
    margin: EdgeInsets.only(right: right.w),
    child: Text(
      text,
      style: TextStyle(
          color: color, fontSize: size.sp, fontWeight: FontWeight.normal),
    ),
  );
}
