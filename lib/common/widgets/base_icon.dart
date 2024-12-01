//reusable icon widget
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget baseIcon(
  Icon icon, {
  int left = 10,
}) {
  return Container(margin: EdgeInsets.only(left: left.w), child: icon);
}