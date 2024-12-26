import 'package:e_learning_klass/common/values/colors.dart';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12.0.h,
      color: AppColors.primaryBackground,
    );
    var answer = Container(
      width: double.infinity,
      height: 50.0,
      color: AppColors.primaryBackground,
    );
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.primarySecondaryElementText.withOpacity(0.5),
      child: EasySeparatedColumn(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        children: [
          EasySeparatedColumn(
            children: [
              line,
              line,
              line,
              line,
            ],
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
          answer,
          answer,
          answer,
        ],
      ),
    );
  }
}
