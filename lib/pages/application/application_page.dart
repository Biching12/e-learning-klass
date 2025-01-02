import 'package:e_learning_klass/common/apis/classes_api.dart';
import 'package:e_learning_klass/common/entities/classes.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/base_app_bar.dart';
import 'package:e_learning_klass/common/widgets/base_nav_bar.dart';
import 'package:e_learning_klass/common/widgets/base_text.dart';

import 'package:e_learning_klass/common/widgets/base_text_form_field.dart';
import 'package:e_learning_klass/common/widgets/flutter_toast.dart';

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
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  List<String> schedules = [];
  int _dayOfWeekFromString(String day) {
    switch (day) {
      case 'Monday':
        return 0;
      case 'Tuesday':
        return 1;
      case 'Wednesday':
        return 2;
      case 'Thursday':
        return 3;
      case 'Friday':
        return 4;
      case 'Saturday':
        return 5;
      case 'Sunday':
        return 6;
      default:
        throw Exception('Invalid day: $day');
    }
  }

  void _showAddScheduleDialog(void Function(void Function()) dialogSetState) {
    String? selectedDay;
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: buildText(
          "Add Schedule",
          color: AppColors.primarySecondaryElementText,
          fontweight: FontWeight.bold,
        ),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedDay,
                  decoration:
                      const InputDecoration(labelText: 'Day of the week'),
                  items: [
                    'Monday',
                    'Tuesday',
                    'Wednesday',
                    'Thursday',
                    'Friday',
                    'Saturday',
                    'Sunday'
                  ]
                      .map((day) => DropdownMenuItem(
                            value: day,
                            child: Text(day),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setDialogState(() => selectedDay = value);
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Start time',
                        ),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setDialogState(() => startTime = time);
                          }
                        },
                        controller: TextEditingController(
                          text: startTime?.format(context) ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'End time',
                        ),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setDialogState(() => endTime = time);
                          }
                        },
                        controller: TextEditingController(
                          text: endTime?.format(context) ?? '',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedDay != null && startTime != null && endTime != null) {
                final schedule =
                    '$selectedDay: ${startTime!.format(context)} - ${endTime!.format(context)}';
                dialogSetState(() {
                  schedules
                      .add(schedule); // Update schedules in the dialog state
                });
                setState(() {}); // Update the main state
                Navigator.pop(context);
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _showCreateClassDialog() {
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
            "Create class",
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
                  labelText: 'Class name',
                  isRequired: true,
                  controller: classNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter class name!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                buildTextFormField(
                  labelText: 'Capacity',
                  controller: capacityController,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of students!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                buildTextFormField(
                  labelText: 'Tuition fee',
                  controller: feeController,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter tuition fee!';
                    }
                    return null;
                  },
                ),
                buildTextFormField(
                  labelText: 'Start Date',
                  isRequired: true,
                  controller: startDateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      startDateController.text =
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                    }
                  },
                ),
                buildTextFormField(
                  labelText: 'End date',
                  isRequired: true,
                  controller: endDateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      endDateController.text =
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                    }
                  },
                ),
                const SizedBox(height: 12),
                _buildScheduleSection(),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: baseText("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _handleCreateClass(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: AppColors.primaryElementStatus,
                    foregroundColor: AppColors.primaryBackground,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('Confirm'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleCreateClass(BuildContext dialogContext) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Xử lý logic liên quan đến dữ liệu
        final List<Schedule> scheduleEntities = schedules.map((schedule) {
          final parts = schedule.split(': ');
          final dayOfWeek = _dayOfWeekFromString(parts[0]);
          final timeRange = parts[1].split(' - ');
          return Schedule(
            dayOfWeek: dayOfWeek,
            startTime: timeRange[0],
            endTime: timeRange[1],
          );
        }).toList();

        final classroomRequest = ClassroomRequestEntity(
          name: classNameController.text,
          capacity: int.parse(capacityController.text),
          tuitionFee: feeController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          schedules: scheduleEntities,
        );

        // Gửi request bất đồng bộ
        final response =
            await ClassroomAPI.createClassroom(params: classroomRequest);

        // Cập nhật giao diện sau khi xử lý xong
        if (response.success) {
          toastInfo(msg: "Class created successfully!");
          if (dialogContext.mounted) {
            Navigator.pop(dialogContext); // Sử dụng context được truyền vào
          }
        } else {
          toastInfo(msg: "Failed to create class!");
        }
      } catch (e) {
        toastInfo(msg: "Error: $e");
      }
    }
  }

  Widget _buildScheduleSection() {
    return StatefulBuilder(
      builder: (context, dialogSetState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...schedules.map((schedule) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        schedule,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                      const Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryThirdBackground,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            dialogSetState(() {
                              schedules.remove(schedule);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Center(
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primaryElementStatus,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () => _showAddScheduleDialog(dialogSetState),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: buildAppBar(context),
            drawer: const BaseNavBar(),
            backgroundColor: AppColors.primaryBackground,
            floatingActionButton:
                state.index == 1 // Chỉ xuất hiện ở trang ClassDetail
                    ? FloatingActionButton(
                        onPressed: _showCreateClassDialog,
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
