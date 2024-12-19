import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/common/entities/entities.dart';

class ClassroomDetailAPI {
  static Future<ClassDetailEntity> getClassroomDetail(int classroomId) async {
    try {
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      final response = await HttpUtil().get(
        "${AppAPI.classroomDetails}/$classroomId",
        headers: headers,
      );

      return ClassDetailEntity.fromJson(response['data']);
    } catch (e) {
      print("Error fetching classroom detail: $e");
      rethrow;
    }
  }
}
