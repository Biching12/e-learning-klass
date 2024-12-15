import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_button.dart';
import 'package:e_learning_klass/common/widgets/base_show_dialog.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:e_learning_klass/common/widgets/image_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget for first part in class detail
Widget imageAndLessonTitle(String text) {
  return Container(
    margin: EdgeInsets.only(top: 12.h),
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
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.w),
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            child: Text(
              text,
              style: const TextStyle(color: AppColors.primaryElementText),
            ),
          ),
        ),
      ],
    ),
  );
}

// widget for second part in class detail
Widget classInfor(String title, String teacher, String studentCount) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: AppColors.primaryFourthElementText),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          "Giáo viên: $teacher",
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          "Sĩ số: $studentCount",
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.primaryText,
          ),
        ),
      ],
    ),
  );
}

//container with information attandence
Widget attandanceInforToday(String text,
    {Color color = AppColors.primaryElementBg}) {
  return Container(
    padding: EdgeInsets.all(8.w),
    width: double.infinity,
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(width: 1, color: AppColors.primaryFourthElementText),
        left: BorderSide(width: 1, color: AppColors.primaryFourthElementText),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Thông tin",
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Hôm nay lớp này ", // Phần văn bản không đổi màu
                style: TextStyle(color: AppColors.primaryText), // Màu mặc định
              ),
              TextSpan(
                text: text, // Phần văn bản đổi màu
                style: const TextStyle(
                    color: AppColors.primaryElementBg), // Màu được áp dụng
              ),
              const TextSpan(
                text: ".", // Phần văn bản đổi màu
                style:
                    TextStyle(color: AppColors.primaryText), // Màu được áp dụng
              ),
            ],
          ),
        )
      ],
    ),
  );
}

// widget detail for class schedule information
Widget classScheduleInfo(
  String title,
  String timeLine1,
  String timeLine2,
  String timeLine3,
) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: AppColors.primaryFourthElementText),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          timeLine1,
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          timeLine2,
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          timeLine3,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.primaryText,
          ),
        ),
      ],
    ),
  );
}

// widget for course detail
Widget lessonDetail(
    String title, String date, String lessonTitle, String dateAndTime,
    {required VoidCallback onPressed1, required VoidCallback onPressed2}) {
  return Container(
    margin: EdgeInsets.only(bottom: 30.h),
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.w)),
      border: const Border(
        right: BorderSide(width: 1, color: AppColors.primaryFourthElementText),
        left: BorderSide(width: 1, color: AppColors.primaryFourthElementText),
        bottom: BorderSide(width: 1, color: AppColors.primaryFourthElementText),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          date,
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          lessonTitle,
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryText),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          dateAndTime,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.primarySecondaryElementText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            baseButton("Điểm danh", onPressed: onPressed1),
            baseButton("Nghỉ",
                color: AppColors.primaryElementBg, onPressed: onPressed2),
          ],
        )
      ],
    ),
  );
}

// widget student list and search
Widget studentList(
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 40.h),
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.w),
      border: Border.all(width: 1, color: AppColors.primaryFourthElementText),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Danh sách học sinh",
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
        ),
        baseTextField(),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => baseShowDialog(context),
            );
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElementStatus,
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: const Center(
                child: Text(
              "Thêm học sinh",
              style: TextStyle(color: AppColors.primaryElementText),
            )),
          ),
        ),
        imageAndText(context, "Dương Quốc Minh", "3"),
      ],
    ),
  );
}
