import 'package:e_learning_klass/common/routes/routes.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/devider_line.dart';
import 'package:e_learning_klass/common/widgets/information_class_card.dart';
import 'package:e_learning_klass/pages/school_schedule/widgets/school_schedule_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SchoolSchedule extends StatefulWidget {
  const SchoolSchedule({super.key});

  @override
  State<SchoolSchedule> createState() => _SchoolScheduleState();
}

class _SchoolScheduleState extends State<SchoolSchedule> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focuseday) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focuseday;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010, 3, 14),
              lastDay: DateTime.utc(2030, 3, 14),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const {
                // Loại bỏ tùy chọn khác
                CalendarFormat.month: 'Month',
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: _onDaySelected,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  // Tuỳ chỉnh kiểu chữ nếu cần
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            dividerLine(
                thickNess: 1, color: AppColors.primaryFourthElementText),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
              child: textCalendar("Danh sách lớp học ngày ${DateFormat(
                'dd/MM/yyyy',
              ).format(_focusedDay)}"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.classDetail);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
                child: buildInfoClassCard(
                  "English 10",
                  "Nguyễn Minh Phương",
                  '12',
                  "18:30 - 20:30",
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
