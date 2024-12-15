import 'package:e_learning_klass/common/apis/user_api.dart';
import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Drawer baseNavBar(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.primaryBackground,
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('Oflutter.com'),
          accountEmail: const Text("lychauminh.qb2@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://themost.com.tr/wp-content/uploads/2023/04/tm-men1_0001_TM-MEN3.jpg",
                width: 90.w,
                height: 90.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            color: AppColors.primaryElement,
            image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2022/09/21/17/02/blue-background-7470781_1280.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.computer,
            color: AppColors.primarySecondaryElementText,
            size: 20.w,
          ),
          title: baseText("Bảng điều khiển"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.calendar_today,
            color: AppColors.primarySecondaryElementText,
            size: 20.w,
          ),
          title: baseText("Lịch học"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: AppColors.primarySecondaryElementText,
            size: 20.w,
          ),
          title: baseText("Đăng xuất"),
          onTap: () async {
            await UserAPI
                .logout(); // Gửi yêu cầu logout tới API và xóa thông tin cục bộ
            if (context.mounted) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
            }
          },
        ),
      ],
    ),
  );
}
