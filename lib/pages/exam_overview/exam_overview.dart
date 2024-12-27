import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/exam_lesson_app_bar.dart';
import 'package:e_learning_klass/common/widgets/exam_time.dart';
import 'package:e_learning_klass/pages/exam_lesson/exam_lesson.dart';
import 'package:flutter/material.dart';

class ExamOverview extends StatefulWidget {
  const ExamOverview({super.key});

  @override
  State<ExamOverview> createState() => _ExamOverviewState();
}

class _ExamOverviewState extends State<ExamOverview> {
  void _onQuestionSelected(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamLesson(
          initialQuestionIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questionCount = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      backgroundColor: AppColors.primaryThirdBackground,
      extendBodyBehindAppBar: true,
      appBar: const ExamLessonAppBar(
        title: "Title here",
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              // Header Timer và Remaining
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    ExamTime(
                      changeColor: false,
                      initialTimeInSeconds:
                          15 * 60, // Thời gian có thể tùy chỉnh
                      onTimeUp: () {
                        // Xử lý khi hết giờ
                        debugPrint("Time's up in ExamOverview!");
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: questionCount,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onQuestionSelected(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryThirdBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Nút Hoàn thành
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryThirdBackground,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Xử lý sự kiện hoàn thành
                    debugPrint("Hoàn thành bài kiểm tra!");
                  },
                  child: const Text(
                    "Hoàn thành",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
