import 'dart:convert';

import 'package:e_learning_klass/common/entities/current_user.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/common/values/constant.dart';
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
      final currentUser = CurrentUserEntity.fromJson(response);
      if (currentUser.success && currentUser.data != null) {
        // Lưu thông tin người dùng vào bộ nhớ cục bộ
        await Global.storageService.setString(
          AppConstants.STORAGE_CURRENT_USER,
          jsonEncode(currentUser.data!.toJson()),
        );
      }
      return currentUser;
    } catch (e) {
      print("Error fetching current user: $e");
      rethrow;
    }
  }
}
