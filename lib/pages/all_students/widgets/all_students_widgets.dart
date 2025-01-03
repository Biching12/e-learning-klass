// import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/apis/student_api.dart';
import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:e_learning_klass/common/widgets/flutter_toast.dart';

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

Widget addStudentDialog(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  return StatefulBuilder(builder: (context, setState) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.w),
      ),
      backgroundColor: AppColors.primaryBackground,
      title: buildText(
        "Add students",
        color: AppColors.primarySecondaryElementText,
        fontweight: FontWeight.bold,
      ),
      content: SizedBox(
        // Đặt kích thước cố định cho phần nội dung
        width: 300.w,
        height: 120.h,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lineAndText(),
                  SizedBox(height: 12.h),
                  baseTextField(
                    text: "Add student email...",
                    controller: emailController, // Gắn controller cho TextField
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
      ),
      actions: isLoading
          ? null
          : [
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  if (email.isEmpty) {
                    toastInfo(msg: "Email is required!");
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  try {
                    final response = await StudentAPI.addStudent(
                      params: AddStudentRequestEntity(email: email),
                    );
                    if (response.success) {
                      toastInfo(msg: "Student added successfully!");
                    } else {
                      toastInfo(msg: "Failed to add student.");
                    }
                  } catch (e) {
                    toastInfo(msg: "Student already existed");
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: AppColors.primarySecondaryElement,
                  foregroundColor: AppColors.primaryBackground,
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text('Ok'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng dialog
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text('Cancel'),
              ),
            ],
    );
  });
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
                  text: "Fields without an asterisk  ",
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
                  text: " are not required",
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
