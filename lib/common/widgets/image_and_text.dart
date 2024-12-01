import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageAndText(String text) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Icon(Icons.person, color: Colors.grey[700]),
    ),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black, // Adjust color based on your theme
      ),
    ),
    onTap: () {
      // Handle student item tap
      print("dssd");
    },
  );
}
