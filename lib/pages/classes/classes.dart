import 'package:e_learning_klass/common/values/colors.dart';

import 'package:e_learning_klass/common/widgets/base_icon.dart';
import 'package:e_learning_klass/common/widgets/devider_line.dart';
import 'package:e_learning_klass/pages/classes/widgets/classes_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 25.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      baseIcon(const Icon(Icons.filter_list)),
                      baseIcon(const Icon(Icons.abc_sharp)),
                      baseIcon(const Icon(Icons.more_vert), left: 0),
                    ],
                  ),
                ],
              ),
            ),
            dividerLine(),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/class_detail");
                      },
                      child: classCard());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
