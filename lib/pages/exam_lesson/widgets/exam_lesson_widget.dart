import 'package:e_learning_klass/common/values/colors.dart';

import 'package:flutter/material.dart';

//answer question card
Widget answerCard(String answer, VoidCallback onTap, bool isSelected) {
  return InkWell(
    borderRadius: BorderRadius.circular(6),
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isSelected
            ? AppColors.primaryThirdBackground
            : Colors.white, // Thay đổi màu nền khi chọn
        border: Border.all(
          color: isSelected
              ? AppColors.primaryThirdBackground
              : Colors.white, // Màu viền thay đổi khi chọn
          width: 2, // Độ dày của viền
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryThirdBackground
                .withOpacity(0.3), // Màu bóng mờ
            offset: const Offset(-2, 3), // Vị trí bóng (x, y)
            blurRadius: 6, // Độ mờ của bóng
            spreadRadius: 1, // Bán kính lan của bóng
          ),
        ],
      ),
      child: Text(
        answer,
        style: TextStyle(
          color:
              isSelected ? Colors.white : Colors.black, // Đổi màu chữ khi chọn
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
