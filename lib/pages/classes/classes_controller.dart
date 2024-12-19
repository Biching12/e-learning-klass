import 'package:e_learning_klass/common/apis/classes_api.dart';
import 'package:flutter/material.dart';

class ClassesController {
  final BuildContext context;

  Future<void> fetchClassroomList() async {
    try {
      final classroomList = await ClassroomAPI.classroomList();

      print('Success: ${classroomList.success}');
      for (var classroom in classroomList.items) {
        print(
            'ID: ${classroom.id}, Name: ${classroom.name}, Teacher: ${classroom.teacherName}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  ClassesController({required this.context});
}
