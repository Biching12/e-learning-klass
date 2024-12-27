import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TuitionTeacher extends StatefulWidget {
  const TuitionTeacher({super.key});

  @override
  State<TuitionTeacher> createState() => _TuitionTeacherState();
}

class _TuitionTeacherState extends State<TuitionTeacher> {
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
                'Hãy xem chi tiết từng lớp bên dưới!',
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 141, 93),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.info_outline),
            ),
            Expanded(
                child: ListView(
              children: [
                ExpansionTile(
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  childrenPadding: const EdgeInsets.all(12),
                  title: const Text(
                    'English 10 (12)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'Đỗ Đăng Khoa',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Nộp tháng 12/2024'),
                      trailing: const Text("200000 đồng"),
                    ),
                    // Add more students here
                  ],
                ),
                ExpansionTile(
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  childrenPadding: const EdgeInsets.all(12),
                  title: const Text(
                    'TOEIC 2 (12)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'Lê Hồng Thanh',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Nộp tháng 12/2024'),
                      trailing: const Text("200000 đồng"),
                    ),
                    ListTile(
                      title: Text(
                        'Lê Hồng Thanh',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Nộp tháng 12/2024'),
                      trailing: const Text("200000 đồng"),
                    ),
                    ListTile(
                      title: Text(
                        'Lê Hồng Thanh',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Nộp tháng 12/2024'),
                      trailing: const Text("200000 đồng"),
                    ),
                    ListTile(
                      title: Text(
                        'Lê Hồng Thanh',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primarySecondaryElementText,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Nộp tháng 12/2024'),
                      trailing: const Text("200000 đồng"),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
