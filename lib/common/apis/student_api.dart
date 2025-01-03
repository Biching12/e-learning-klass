import 'dart:convert';

import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/common/entities/entities.dart';

class StudentAPI {
  static Future<AllStudentsResponseEntity> getAllStudents() async {
    try {
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      final response = await HttpUtil().get(
        AppAPI.allStudentsOfAllClassrooms,
        headers: headers,
      );

      if (response['success'] == true && response['data'] != null) {
        return AllStudentsResponseEntity.fromJson(response);
      } else {
        throw Exception('Failed to fetch students: ${response['message']}');
      }
    } catch (e) {
      throw Exception('Error fetching students: $e');
    }
  }

  static Future<AddStudentResponseEntity> addStudent({
    required AddStudentRequestEntity params,
  }) async {
    try {
      // Lấy Access Token từ Storage
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      // Định nghĩa Headers
      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      };

      // Gọi API bằng HttpUtil
      final response = await HttpUtil().post(
        AppAPI.addStudent, // Endpoint của bạn
        data: jsonEncode(params.toJson()),
        headers: headers,
      );

      // Parse response thành AddStudentResponse
      return AddStudentResponseEntity.fromJson(response);
    } catch (e) {
      print("Error adding student: $e");
      rethrow;
    }
  }
}
