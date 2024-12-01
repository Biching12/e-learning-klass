// class list widget
import 'package:e_learning_klass/common/widgets/information_class_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget classCard() {
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
          child: buildInfoClassCard("English 10", "Nguyễn Minh Phương",
              "Ngô Thục Anh", '12', "18:30 - 20:30",
              boder: 1),
        ),
      ],
    ),
  );
}
