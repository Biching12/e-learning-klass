import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

// Add teacher dialog
Widget addTeacherDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.w),
    ),
    backgroundColor: AppColors.primaryBackground,
    title: buildText(
      "Thêm học sinh",
      color: AppColors.primarySecondaryElementText,
      fontweight: FontWeight.bold,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _lineAndText(),
        SizedBox(height: 12.h),
        baseTextField(),
        SizedBox(height: 12.h),
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: AppColors.primarySecondaryElement,
          foregroundColor: AppColors.primaryBackground,
          shape: const RoundedRectangleBorder(),
        ),
        child: const Text('Ok'),
      ),
    ],
  );
}

Widget _lineAndText() {
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
                  text: "Những trường không có dấu sao ",
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
                  text: " không bắt buộc",
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
