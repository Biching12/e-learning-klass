import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/image_and_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({super.key});

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8)),
                        child: Image.asset(
                          'assets/images/class-list.png', // Replace with actual image
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          color: Colors.black.withOpacity(0.5),
                          width: double.infinity,
                          child: const Text(
                            "11/10: Không có nội dung",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppColors.primaryFourthElementText),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "English 10",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Giáo viên: Nguyễn Minh Phương",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Đồng giảng 1: Ngô Thục Anh",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Sĩ số: 10",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 35.h,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          width: 1, color: AppColors.primaryFourthElementText),
                      left: BorderSide(
                          width: 1, color: AppColors.primaryFourthElementText),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppColors.primaryFourthElementText),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lịch học",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Chủ nhật: 16:00 - 18:00",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Thứ ba: 16:00 - 18:00",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Thứ năm: 16:00 - 18:00",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8.w)),
                    border: const Border(
                      right: BorderSide(
                          width: 1, color: AppColors.primaryFourthElementText),
                      left: BorderSide(
                          width: 1, color: AppColors.primaryFourthElementText),
                      bottom: BorderSide(
                          width: 1, color: AppColors.primaryFourthElementText),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tiết dạy",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "T3, 11 - Thg 10",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "Buổi 1: Không có nội dung",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primaryText),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        "11/10 | 16:00 - 18:00",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.primarySecondaryElementText,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.w,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                        width: 1, color: AppColors.primaryFourthElementText),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Danh sách học sinh",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryText),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm...', // Placeholder text
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          border: InputBorder.none, // Remove default border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, // Custom underline color
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors
                                  .primaryFourthElementText, // Underline color when focused
                              width: 1,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      imageAndText(context, "Dương Quốc Minh"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
