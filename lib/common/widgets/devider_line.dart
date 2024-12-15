//line widget
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';

Widget dividerLine(
    {double thickNess = 10, Color color = AppColors.deviderLineColorElement}) {
  return Divider(
    height: 20,
    thickness: thickNess,
    indent: 0,
    endIndent: 1,
    color: color,
  );
}
