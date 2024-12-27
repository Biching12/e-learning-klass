import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_button.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/controller/nav_bav_controller.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_events.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_states.dart';

import 'package:e_learning_klass/pages/class_detail/widgets/class_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
                          classDetail.studentCount.toString()),
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
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaypalCheckoutView(
                                      sandboxMode: true,
                                      clientId:
                                          "Afu50i1zd2U5i5MdqCJ5oGcsfs6LoH6WTld2QVUBhr_BY5350vmGU5m984WiCbBxY8VA7iGO80shPX-Q",
                                      secretKey:
                                          "EOqwG0z0-FET20HWxdV9rjV0NAoJHh3gJRz-lE7bxnVNHT_QZKeNWEcua9kDCVKaBF23Y88yi5BmXH_C",
                                      transactions: const [
                                        {
                                          "amount": {
                                            "total": '70',
                                            "currency": "USD",
                                            "details": {
                                              "subtotal": '70',
                                              "shipping": '0',
                                              "shipping_discount": 0
                                            }
                                          },
                                          "description":
                                              "The payment transaction description.",
                                          // "payment_options": {
                                          //   "allowed_payment_method":
                                          //       "INSTANT_FUNDING_SOURCE"
                                          // },
                                          "item_list": {
                                            "items": [
                                              {
                                                "name": "Apple",
                                                "quantity": 4,
                                                "price": '5',
                                                "currency": "USD"
                                              },
                                              {
                                                "name": "Pineapple",
                                                "quantity": 5,
                                                "price": '10',
                                                "currency": "USD"
                                              }
                                            ],

                                            // shipping address is not required though
                                            //   "shipping_address": {
                                            //     "recipient_name": "tharwat",
                                            //     "line1": "Alexandria",
                                            //     "line2": "",
                                            //     "city": "Alexandria",
                                            //     "country_code": "EG",
                                            //     "postal_code": "21505",
                                            //     "phone": "+00000000",
                                            //     "state": "Alexandria"
                                            //  },
                                          }
                                        }
                                      ],
                                      note:
                                          "Contact us for any questions on your order.",
                                      onSuccess: (Map params) async {
                                        print("onSuccess: $params");
                                      },
                                      onError: (error) {
                                        print("onError: $error");
                                        Navigator.pop(context);
                                      },
                                      onCancel: () {
                                        print('cancelled:');
                                      },
                                    ),
                                  ));
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
