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
        _buildTitle(title),
        SizedBox(
          height: 8.w,
        ),
        _buildText("Giáo viên: $teacher"),
        SizedBox(
          height: 8.w,
        ),
        _buildText("Sĩ số: $studentCount"),
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
        _buildTitle("Thông tin"),
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
Widget classScheduleInfo(String title, List<String> schedules) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: AppColors.primaryFourthElementText),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(title),
        SizedBox(
          height: 8.w,
        ),
        SizedBox(height: 8.w),
        ...schedules.map(
          (schedule) => Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: _buildText(schedule),
          ),
        ),
      ],
    ),
  );
}

// widget for lesson detail
Widget lessonDetail({
  required BuildContext context,
  required String title,
  required List<Map<String, String>> lessons,
  required VoidCallback onAttendancePressed,
  required VoidCallback onAbsencePressed,
}) {
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
        _buildTitle(title),
        SizedBox(
          height: 8.w,
        ),
        ...lessons.map(
          (lesson) => Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText("${lesson['topic']}: ${lesson['note']}",
                    color: AppColors.primarySecondaryElement),
                SizedBox(height: 4.w),
                _buildText("T3, 11 - Thg10",
                    fontSize: 11, color: AppColors.primarySecondaryElementText)
              ],
            ),
          ),
        ),
        _buildText("Xem thêm..."),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            baseButton("Điểm danh", onPressed: onAttendancePressed),
            baseButton("Nghỉ",
                color: AppColors.primaryElementBg, onPressed: onAbsencePressed),
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

// rebuild title
Widget _buildTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 18.sp, color: AppColors.primaryText),
  );
}

//rebuild text
Widget _buildText(String text,
    {int fontSize = 13, Color color = AppColors.primaryText}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: color,
    ),
  );
}
