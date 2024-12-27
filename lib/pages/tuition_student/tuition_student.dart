import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TuitionStudent extends StatefulWidget {
  const TuitionStudent({super.key});

  @override
  State<TuitionStudent> createState() => _TuitionStudentState();
}

class _TuitionStudentState extends State<TuitionStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lịch sử giao dịch",
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.primaryBackground,
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Hãy kiểm tra học phí mà bạn nộp!',
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 141, 93),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.info_outline),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 14, // Generate 20 items
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Lê Hồng Thanh ', // Add index for uniqueness
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primarySecondaryElementText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Nộp tháng 12/2024'),
                    trailing: const Text("200000 đồng"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
