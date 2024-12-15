import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';

Widget baseTextField({String text = "Tìm kiếm..."}) {
  return TextField(
    decoration: InputDecoration(
      hintText: text, // Placeholder text
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14.0,
      ),
      border: InputBorder.none, // Remove default border
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey, // Custom underline color
          width: 1.0,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors
              .primaryFourthElementText, // Underline color when focused
          width: 1,
        ),
      ),
    ),
    style: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
  );
}
