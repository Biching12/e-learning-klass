// class list widget
import 'package:e_learning_klass/common/entities/classes.dart';
import 'package:e_learning_klass/common/values/colors.dart';

import 'package:e_learning_klass/common/widgets/information_class_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget classCard(ClassroomDataEntity classroom) {
  return Card(
    elevation: 4,
    margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 40.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: Image.asset(
            'assets/images/class-list.png', // Replace with actual image
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: buildInfoClassCard(classroom.name, classroom.teacherName,
              boder: 1),
        ),
      ],
    ),
  );
}

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

Widget lineAndText() {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 4,
          color: AppColors.primarySecondaryElement,
          margin: EdgeInsets.only(right: 8.w),
        ),
        Expanded(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Fields without an asterisk ",
                  style: TextStyle(
                    color:
                        AppColors.primarySecondaryElementText, // Màu chữ chính
                    fontSize: 16, // Cỡ chữ
                  ),
                ),
                TextSpan(
                  text: "*", // Dấu sao màu đỏ
                  style: TextStyle(
                    color: AppColors.primaryThirdElement, // Màu đỏ
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: " are optional.",
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
