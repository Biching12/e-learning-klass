import 'dart:convert';
import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/pages/tools/widgets/tool_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});

  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  List<PlatformFile>? selectedFiles;
  List<Map<String, dynamic>> questions = [];
  List<int?> selectedAnswers =
      []; // Stores the selected answer index for each question

  // Function to handle checkbox change
  void onCheckboxChanged(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex; // Update selected answer
    });
  }

// Function to parse answers with single selection
  void parseAnswersWithSelection(List<Map<String, dynamic>> questionsData) {
    questions = questionsData;
    selectedAnswers =
        List<int?>.filled(questions.length, null); // Initialize as no selection
  }

  // Handle file upload and conversion to JSON
  Future uploadFile() async {
    String jsonString = '''[ 
      { "question": "What does the term 'pollution' mean?", "answers": [ { "text": "The manifestation of any solicited foreign substance in something", "is_correct": false }, { "text": "The contamination of natural resources", "is_correct": false }, { "text": "The manifestation of any unsolicited foreign substance in something", "is_correct": true }, { "text": "The destruction of the natural environment", "is_correct": false } ] },
      { "question": "What is the main cause of pollution on earth?", "answers": [ { "text": "Natural disasters", "is_correct": false }, { "text": "Human activities", "is_correct": true }, { "text": "Weather conditions", "is_correct": false }, { "text": "Lack of technology", "is_correct": false } ] },
      { "question": "Why is it necessary to tackle pollution?", "answers": [ { "text": "It's a minor issue", "is_correct": false }, { "text": "It's a major environmental hazard", "is_correct": true }, { "text": "We don't have to worry about it", "is_correct": false }, { "text": "We are not responsible for it", "is_correct": false } ] }
    ]''';

    var jsonData = jsonDecode(jsonString);
    List<Map<String, dynamic>> questionsData =
        List<Map<String, dynamic>>.from(jsonData);

    parseAnswersWithSelection(questionsData);

    setState(() {
      // Update the state with parsed questions and answers
    });
  }

  // Handle file selection
  Future selectFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, // Allow multiple file selection
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          if (selectedFiles == null) {
            selectedFiles = result.files;
          } else {
            selectedFiles!.addAll(result.files);
          }
        });
      } else {
        print('No files selected');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primaryBackground,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Công cụ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                color: AppColors.primaryBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                      color: AppColors.primaryThirdBackground, width: 2.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chuyển đổi file pdf sang Q&A',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primarySecondaryElement,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.picture_as_pdf,
                            size: 30.0,
                            color: AppColors.primaryBackground,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return Dialog(
                                      child: Container(
                                        padding: EdgeInsets.all(12.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            buildTextTool(
                                              "Tải tập tin lên",
                                              color: AppColors
                                                  .primarySecondaryElementText,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize:
                                                        Size(180.w, 40.h),
                                                    backgroundColor: AppColors
                                                        .primaryThirdBackground,
                                                    foregroundColor: AppColors
                                                        .primaryElementText,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    await selectFile();
                                                    setState(
                                                        () {}); // Rebuild the dialog's content
                                                  },
                                                  child: const Text(
                                                      "Chọn file của bạn"),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize:
                                                        Size(180.w, 40.h),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            100, 5, 205, 112),
                                                    foregroundColor: AppColors
                                                        .primaryElementText,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    await uploadFile();
                                                    setState(
                                                        () {}); // Rebuild the dialog's content
                                                  },
                                                  child: const Text(
                                                      "Tải file ở đây"),
                                                ),
                                                selectedFiles != null &&
                                                        selectedFiles!
                                                            .isNotEmpty
                                                    ? SizedBox(
                                                        height: 200.h,
                                                        child: ListView.builder(
                                                          itemCount:
                                                              selectedFiles!
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final file =
                                                                selectedFiles![
                                                                    index];
                                                            return ListTile(
                                                              title: Text(
                                                                file.name,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                              ),
                                                              trailing:
                                                                  IconButton(
                                                                icon: const Icon(
                                                                    FluentIcons
                                                                        .dismiss_circle_32_filled,
                                                                    color: AppColors
                                                                        .primaryThirdElement),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    selectedFiles!
                                                                        .removeAt(
                                                                            index); // Remove the file
                                                                  });
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : const Text(
                                                        'No files selected or picker canceled.',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Render editable questions and answers
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, questionIndex) {
                      final question = questions[questionIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Hãy chỉnh sửa câu hỏi và câu trả lời của bạn',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Editable Question
                          TextField(
                            controller: TextEditingController(
                                text: question['question']),
                            onChanged: (text) {
                              setState(() {
                                question['question'] = text;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Question',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Space between question and answers
                          Column(
                            children: List.generate(
                              question['answers'].length,
                              (answerIndex) {
                                final answer = question['answers'][answerIndex];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 12.h),
                                  child: Row(
                                    children: [
                                      Radio<int>(
                                        value: answerIndex,
                                        groupValue:
                                            selectedAnswers[questionIndex],
                                        onChanged: (int? value) {
                                          onCheckboxChanged(
                                              questionIndex, value!);
                                        },
                                      ),
                                      // Editable Answer
                                      Expanded(
                                        child: TextField(
                                          controller: TextEditingController(
                                              text: answer['text']),
                                          onChanged: (text) {
                                            setState(() {
                                              answer['text'] = text;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'Answer',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20), // Space between questions
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
