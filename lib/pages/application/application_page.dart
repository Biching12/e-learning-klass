import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/common/widgets/base_text.dart';
import 'package:e_learning_klass/common/widgets/base_text_field.dart';
import 'package:e_learning_klass/common/widgets/base_text_form_field.dart';
import 'package:e_learning_klass/common/widgets/expandable_section.dart';
import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/application/bloc/app_states.dart';
import 'package:e_learning_klass/pages/application/widgets/application_widgets.dart';
import 'package:e_learning_klass/pages/classes/widgets/classes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  bool isAdditionalInfoExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: buildAppBar(context),
            drawer: const BaseNavBar(),
            backgroundColor: AppColors.primaryBackground,
            floatingActionButton: state.index ==
                    1 // Chỉ xuất hiện ở trang ClassDetail
                ? FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => Form(
                          key: _formKey,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            backgroundColor: AppColors.primaryBackground,
                            title: buildText(
                              "Tạo lớp",
                              color: AppColors.primarySecondaryElementText,
                              fontweight: FontWeight.bold,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  lineAndText(),
                                  SizedBox(height: 12.h),
                                  buildTextFormField(
                                    labelText: 'Tên lớp',
                                    isRequired: true,
                                    controller: classNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập tên lớp';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 12.h),
                                  buildTextFormField(
                                    labelText: 'Học phí/tháng',
                                    controller: feeController,
                                    isRequired: true,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập học phí';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  buildExpandableSection(
                                    title: 'Lịch học',
                                    isExpanded: true,
                                    icon: Icons.add,
                                    onToggle: () {
                                      setState(() {});
                                    },
                                  ),
                                  buildExpandableSection(
                                    title: 'Thông tin thêm',
                                    isExpanded: isAdditionalInfoExpanded,
                                    icon: Icons.expand_more,
                                    onToggle: () {
                                      setState(() {
                                        isAdditionalInfoExpanded =
                                            !isAdditionalInfoExpanded;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: baseText("Hủy"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        // Process the form data
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Tạo lớp thành công!')),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 4,
                                      backgroundColor:
                                          AppColors.primaryElementStatus,
                                      foregroundColor:
                                          AppColors.primaryBackground,
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                    child: const Text('Xác nhận'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    backgroundColor: AppColors.primaryFourthElement,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primaryBackground,
                    ),
                  )
                : null,
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: buildBottomNavBar(context, state.index),
            ),
          ),
        );
      },
    );
  }
}
