import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget genderButton(String label, String value, String selectedGender,
    void Function(String gender) onSelect) {
  return GestureDetector(
    onTap: () {
      onSelect(value);
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: selectedGender == value
            ? AppColors.primaryElement
            : Colors.transparent,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryFourthElementText),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selectedGender == value
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}

Future<void> selectDate(
    BuildContext context, Function(DateTime) onDateSelected) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (picked != null) {
    onDateSelected(picked);
  }
}
