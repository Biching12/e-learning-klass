import 'package:e_learning_klass/common/apis/payment.dart';
import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/values/colors.dart';

import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_button.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/controller/nav_bav_controller.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_events.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_states.dart';

import 'package:e_learning_klass/pages/class_detail/widgets/class_detail_widget.dart';
import 'package:e_learning_klass/pages/payment_page/paypal_payment_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({super.key});

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Lấy id từ arguments khi màn hình được push
    final classroomId = ModalRoute.of(context)?.settings.arguments as int?;

    if (classroomId != null) {
      // Gọi API với id của classroom
      context.read<ClassDetailBlocs>().add(FetchClassDetail(classroomId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserData = _navBavController.currentUserData;
    return SafeArea(
      child: BlocBuilder<ClassDetailBlocs, ClassDetailStates>(
        builder: (context, state) {
          if (state is ClassDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ClassDetailLoaded) {
            final classDetail = state.classDetail;
            return Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: buildAppBar(context),
              drawer: const BaseNavBar(),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25.w,
                  ),
                  child: Column(
                    children: [
                      imageAndLessonTitle(classDetail.code),
                      classInfor(
                          classDetail.name,
                          classDetail.teachers[0].fullName,
                          classDetail.studentCount.toString(),
                          classDetail.tuitionFee),
                      attandanceInforToday("có học"),
                      classScheduleInfo(
                        "Lịch học",
                        classDetail.schedules
                            .map((schedule) =>
                                "${schedule.dayOfWeek}: ${schedule.startTime} - ${schedule.endTime}")
                            .toList(),
                      ),
                      lessonDetail(
                        context: context,
                        title: "Tiết dạy",
                        lessons: classDetail.lessons.map((lesson) {
                          return {
                            'topic': lesson.topic,
                            'note': lesson.note,
                          };
                        }).toList(),
                        onAttendancePressed: baseButton(
                          "Điểm danh",
                          onPressed: () {},
                        ),
                        onAbsencePressed: currentUserData.role == "TEACHER"
                            ? baseButton(
                                "Nghỉ",
                                color: AppColors.primaryThirdElement,
                                onPressed: () {},
                              )
                            : baseButton(
                                "Nộp học phí",
                                color: AppColors.primaryElementStatus,
                                onPressed: () async {
                                  try {
                                    final request = CreateOrderRequestEntity(
                                      method: "PAYPAL",
                                      amount: 200,
                                      classroomId: 100,
                                      note: "Thanh toán học phí",
                                    );
                                    final response =
                                        await PaymentAPI.createOrder(
                                            params: request);
                                    if (response.success) {
                                      final approvalUrl = response
                                          .data.order.links
                                          .firstWhere(
                                              (link) => link.rel == 'approve')
                                          .href;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PaypalPaymentPage(
                                            approvalUrl: approvalUrl,
                                          ),
                                        ),
                                      );
                                    } else {
                                      // Xử lý khi tạo đơn hàng không thành công
                                    }
                                  } catch (e) {
                                    // Xử lý lỗi
                                  }
                                },
                              ),
                      ),
                      studentList(context),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ClassDetailError) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
