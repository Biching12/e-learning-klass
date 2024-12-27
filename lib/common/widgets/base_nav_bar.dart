import 'package:e_learning_klass/common/apis/authentication_api.dart';

import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_text.dart';
import 'package:e_learning_klass/controller/nav_bav_controller.dart';

import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/application/bloc/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseNavBar extends StatefulWidget {
  const BaseNavBar({super.key});

  @override
  State<BaseNavBar> createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  late NavBavController _navBavController;

  @override
  void initState() {
    super.initState();
    _navBavController = NavBavController();
    _navBavController.init().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserData = _navBavController.currentUserData;
    return Drawer(
      backgroundColor: AppColors.primaryBackground,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
                "${currentUserData.firstName ?? ''} ${currentUserData.lastName ?? 'Loading...'}"),
            accountEmail: Text(currentUserData.email ?? "Loading..."),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: currentUserData.avatarUrl != null
                    ? Image.network(
                        currentUserData.avatarUrl!,
                        width: 90.w,
                        height: 90.h,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.person, size: 40.w),
              ),
            ),
            decoration: const BoxDecoration(
              color: AppColors.primarySecondaryElementText,
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
          currentUserData.role == "TEACHER"
              ? ListTile(
                  leading: Icon(
                    Icons.attach_money_rounded,
                    color: AppColors.primarySecondaryElementText,
                    size: 20.w,
                  ),
                  title: baseText("Tài chính"),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.tuitionTeacher);
                  },
                )
              : ListTile(
                  leading: Icon(
                    Icons.attach_money_rounded,
                    color: AppColors.primarySecondaryElementText,
                    size: 20.w,
                  ),
                  title: baseText("Học phí"),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.tuitionStudent);
                  },
                ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: AppColors.primarySecondaryElementText,
              size: 20.w,
            ),
            title: baseText("Lịch học"),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.schoolSchedule);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: AppColors.primarySecondaryElementText,
              size: 20.w,
            ),
            title: baseText("Đăng xuất"),
            onTap: () async {
              await AuthenticationAPI
                  .logout(); // Gửi yêu cầu logout tới API và xóa thông tin cục bộ
              if (context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.signIn, (route) => false);
                context.read<AppBloc>().add(const TriggerAppEvent(0));
              }
            },
          ),
        ],
      ),
    );
  }
}
