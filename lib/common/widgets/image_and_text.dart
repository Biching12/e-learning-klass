import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageAndText(BuildContext context, String text, String subtext,
    {bool changeText = true}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Icon(Icons.person, color: Colors.grey[700]),
    ),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryText, // Adjust color based on your theme
      ),
    ),
    subtitle: Text(
      "Số ngày nghỉ: $subtext",
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors
            .primarySecondaryElementText, // Adjust color based on your theme
      ),
    ),
    onTap: () {
      // Handle student item tap
      showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(
                    "Thông tin",
                    color: AppColors.primarySecondaryElementText,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 50.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      _buildText("Dương Quốc Minh",
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                  buildTitleAndDesc("Số điện thoại", "089238482384"),
                  (changeText == false)
                      ? buildTitleAndDesc("Lớp đang dạy", "English 10")
                      : buildTitleAndDesc("Lớp đang học", "English 10"),
                  buildTitleAndDesc("Ngày sinh", "15/05/2002"),
                  buildTitleAndDesc("Giới tính", "Nam"),
                  buildTitleAndDesc("Địa chỉ", "Ba Đình, Hà Nội"),
                  buildLinked("Liên kết: ", "https://www.figma.com/"),
                  baseButton("Hủy", onPressed: () {
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildText(String text,
    {Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: fontWeight,
    ),
  );
}

// reusable title and description widget
Widget buildTitleAndDesc(
  String title,
  String desc, {
  int top = 20,
  Color color = AppColors.primaryText,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: color, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          desc,
          style: TextStyle(color: color, fontSize: 16.sp),
        ),
      ],
    ),
  );
}

Widget buildLinked(
  String title,
  String desc, {
  int top = 20,
  Color color = AppColors.primaryText,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: color, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Icon(Icons.link),
            SizedBox(
              width: 10.w,
            ),
            Text(
              desc,
              style: TextStyle(color: color, fontSize: 16.sp),
            ),
          ],
        ),
      ],
    ),
  );
}
