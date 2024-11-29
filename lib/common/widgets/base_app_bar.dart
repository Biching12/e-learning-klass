import 'package:e_learning_klass/common/values/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Icon(
              Icons.menu,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text(
            "Chưa đặt tên",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Icon(
            FluentIcons.search_20_filled,
            color: AppColors.primarySecondaryElementText,
          ),
        ],
      ),
    ),
  );
}
