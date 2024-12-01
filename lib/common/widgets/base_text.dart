import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget baseText(String text,
    {Color color = AppColors.primaryText,
    int size = 13,
    FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size.sp, fontWeight: fontWeight),
  );
}
