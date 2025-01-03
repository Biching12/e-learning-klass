import 'package:e_learning_klass/common/routes/names.dart';
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
Widget classInfor(
    String title, String teacher, String studentCount, String tuitionFee) {
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
        SizedBox(
          height: 8.w,
        ),
        _buildText("Học phí: $tuitionFee/tháng"),
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
  required Widget onAttendancePressed,
  required Widget onAbsencePressed,
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
          (lesson) => _buildLessonDetail(context, lesson),
        ),
        GestureDetector(
            onTap: () {
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
                            "Danh sách bài học",
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 12.h),
                          ...lessons.map(
                              (lesson) => _buildLessonDetail(context, lesson)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    // Thực hiện các thao tác cần thiết với danh sách học sinh đã chọn

                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primarySecondaryElement,
                                    foregroundColor:
                                        AppColors.primaryBackground,
                                    shape: const RoundedRectangleBorder(),
                                  ),
                                  child: const Text('OK'))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: _buildText("Xem thêm...")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            onAttendancePressed,
            onAbsencePressed,
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
        imageAndText(context,
            fullName: "Dương Quốc Minh", absent: "3", avatarUrl: null),
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
    {int fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

//rebuild lesson detail
Widget _buildLessonDetail(BuildContext context, Map<String, String> lesson) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.examLesson);
          },
          child: _buildText("${lesson['topic']}: ${lesson['note']}",
              color: AppColors.primarySecondaryElement),
        ),
        SizedBox(height: 4.w),
        _buildText("T3, 11 - Thg10",
            fontSize: 11, color: AppColors.primarySecondaryElementText)
      ],
    ),
  );
}
