import 'package:e_learning_klass/common/entities/current_user.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';

class UserAPI {
  static Future<CurrentUserEntity> getCurrentUser() async {
    try {
      // Lấy access token từ bộ nhớ cục bộ
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      // Tạo header Authorization với Bearer token
      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      // Gửi yêu cầu GET để lấy thông tin người dùng
      final response = await HttpUtil().get(
        AppAPI.currentUser, // Endpoint /api/user/me
        headers: headers,
      );

      // Parse response thành CurrentUserEntity
      return CurrentUserEntity.fromJson(response);
    } catch (e) {
      print("Error fetching current user: $e");
      rethrow;
    }
  }
}
