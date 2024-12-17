import 'package:e_learning_klass/common/entities/entities.dart';

import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';

class AuthenticationAPI {
  static Future<LoginResponseEntity> login(
      {required LoginRequestEntity params}) async {
    try {
      final response =
          await HttpUtil().post(AppAPI.login, data: params.toJson());
      return LoginResponseEntity.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RegisterResponseEntity> register({
    required RegisterRequestEntity params,
  }) async {
    try {
      final response =
          await HttpUtil().post(AppAPI.register, data: params.toJson());

      return RegisterResponseEntity.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    try {
      // Lấy access token từ bộ nhớ cục bộ
      String? accessToken = Global.storageService.getAccessToken();

      // Kiểm tra token có tồn tại không
      if (accessToken == null) {
        print("No access token found. Already logged out.");
        return;
      }

      // Tạo header Authorization với Bearer token
      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken"
      };

      // Gửi yêu cầu logout tới API
      final response = await HttpUtil().post(
        AppAPI.logout,
        data: {}, // Có thể cần gửi thêm body tùy vào backend
        queryParameters: null,
        headers: headers, // Truyền header vào request
      );
      if (response == null || response == "" || response.statusCode == 204) {
        // Thành công, xóa token
        await Global.storageService.clearTokens();
        print("Logout successful with status 204. Tokens cleared.");
      } else {
        print("Logout failed. Unexpected response: $response");
      }
      // Xóa thông tin token khỏi bộ nhớ cục bộ
      await Global.storageService.clearTokens();
      print("Logout successful. Tokens cleared.");
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
