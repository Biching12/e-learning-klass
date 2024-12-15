import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget baseShowDialog(
  BuildContext context,
) {
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
            "Thêm học sinh vào lớp",
            color: AppColors.primarySecondaryElementText,
          ),
          baseTextField(),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: const Text(
                  'Đóng',
                  style:
                      TextStyle(color: AppColors.primarySecondaryElementText),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Thực hiện các thao tác cần thiết với danh sách học sinh đã chọn

                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarySecondaryElement,
                    foregroundColor: AppColors.primaryBackground,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('Xác nhận'))
            ],
          )
        ],
      ),
    ),
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
