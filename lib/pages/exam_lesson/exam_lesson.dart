import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/common/widgets/exam_lesson_app_bar.dart';
import 'package:e_learning_klass/common/widgets/exam_time.dart';
import 'package:e_learning_klass/pages/exam_lesson/widgets/exam_lesson_widget.dart';

import 'package:flutter/material.dart';

class ExamLesson extends StatefulWidget {
  final int initialQuestionIndex; // Tham số nhận chỉ số câu hỏi ban đầu
  const ExamLesson({super.key, this.initialQuestionIndex = 0});

  @override
  State<ExamLesson> createState() => _ExamLessonState();
}

class _ExamLessonState extends State<ExamLesson> {
  // Danh sách câu hỏi và các câu trả lời
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Which of the following is a unit of electric current:",
      "answers": ["A. ohm", "B. volt", "C. watt", "D. amp"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a unit of electric current:",
      "answers": ["A. ohm", "B. volt", "C. watt", "D. amp"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a unit of electric current:",
      "answers": ["A. ohm", "B. volt", "C. watt", "D. amp"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
    {
      "question": "Which of the following is a good conductor of electricity?",
      "answers": ["A. Copper", "B. Wood", "C. Plastic", "D. Rubber"],
      "selectedAnswer": -1, // Chỉ số câu trả lời được chọn
    },
  ];

  int currentPage = 0; // Trang hiện tại
  final int questionsPerPage = 5; // Số câu hỏi tối đa trên mỗi trang

  late ScrollController _scrollController; // Controller để quản lý cuộn

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Khởi tạo ScrollController
    currentPage = (widget.initialQuestionIndex / questionsPerPage).floor();
  }

  void scrollToTop() {
    // Cuộn về đầu danh sách
    _scrollController.animateTo(
      0, // Vị trí cuộn về đầu
      duration: const Duration(milliseconds: 300), // Thời gian cuộn
      curve: Curves.easeInOut, // Hiệu ứng cuộn
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Giải phóng ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = (questions.length / questionsPerPage).ceil();
    return Scaffold(
      backgroundColor: AppColors.primaryThirdBackground,
      appBar: ExamLessonAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: AppColors.primaryBackground, width: 2),
            ),
          ),
          child: ExamTime(
            initialTimeInSeconds: 15 * 60,
            onTimeUp: () {
              // Hành động khi hết giờ
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Time's up!"),
                  content: const Text("You have run out of time."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        showActionIcon: true,
        titleWidget: const Text("Title here",
            style: TextStyle(color: AppColors.primaryElementText)),
        onMenuActionTap: () {
          Navigator.pushNamed(context, AppRoutes.examOverview,
              arguments: questions.length);
        },
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
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: questionsPerPage,
                          itemBuilder: (context, index) {
                            final questionIndex =
                                currentPage * questionsPerPage + index;
                            if (questionIndex >= questions.length) {
                              return const SizedBox.shrink();
                            }
                            final question = questions[questionIndex];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Q${questionIndex + 1}: ${question['question']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: question['answers'].length,
                                    itemBuilder: (context, answerIndex) {
                                      return answerCard(
                                        question['answers'][answerIndex],
                                        () {
                                          setState(() {
                                            question['selectedAnswer'] =
                                                answerIndex;
                                          });
                                        },
                                        question['selectedAnswer'] ==
                                            answerIndex,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 8),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentPage--;
                            scrollToTop();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryThirdBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    if (currentPage == 0)
                      const SizedBox(width: 48), // Placeholder
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (currentPage < totalPages - 1) {
                            currentPage++;
                          } else {
                            Navigator.pushNamed(context, AppRoutes.examOverview,
                                arguments: questions.length);
                          }
                          scrollToTop();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryThirdBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        currentPage < totalPages - 1
                            ? "Tiếp theo"
                            : "Hoàn thành",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
