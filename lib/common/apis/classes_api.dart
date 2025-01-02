import 'dart:convert';

import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';

class ClassroomAPI {
  static Future<ClassroomResponseEntity> classroomList() async {
    try {
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      final response = await HttpUtil().get(
        AppAPI.allListOfClassroom, // Endpoint /api/classroom
        headers: headers,
      );

      // Parse response thành ClassroomResponse
      return ClassroomResponseEntity.fromJson(response);
    } catch (e) {
      print("Error fetching classrooms: $e");
      rethrow;
    }
  }

  static Future<CreateClassroomResponseEntity> createClassroom({
    required ClassroomRequestEntity params,
  }) async {
    try {
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      };

      final response = await HttpUtil().post(
        AppAPI.createNewClassroom,
        data: jsonEncode(params.toJson()),
        headers: headers,
      );

      // Parse response thành ClassroomResponseEntity
      return CreateClassroomResponseEntity.fromJson(response);
    } catch (e) {
      print("Error creating classroom: $e");
      rethrow;
    }
  }
}
