import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//reusable text widget
Widget buildText(
  String text, {
  Color color = AppColors.primaryText,
  int top = 20,
  int size = 14,
  int right = 30,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h, right: right.w),
    child: Text(
      text,
      style: TextStyle(
          color: color, fontSize: size.sp, fontWeight: FontWeight.normal),
    ),
  );
}

//reusable icon widget
Widget buildIcon(
  Icon icon,
) {
  return icon;
}

// widget line
Widget dividerLine() {
  return const Divider(
    height: 20,
    thickness: 10,
    indent: 0,
    endIndent: 1,
    color: Colors.black,
  );
}

Widget buildListStudents(List<String> students) {
  return Expanded(
    // Ensure the ListView takes up available vertical space
    child: ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[700]),
          ),
          title: Text(
            students[index],
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black, // Adjust color based on your theme
            ),
          ),
          onTap: () {
            // Handle student item tap
            print('Tapped on ${students[index]}');
          },
        );
      },
    ),
  );
}
