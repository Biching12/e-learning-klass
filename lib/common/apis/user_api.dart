import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/path_apis/api_constants.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/global.dart';

class UserAPI {
  static Future<LoginResponseEntity> login(
      {required LoginRequestEntity params}) async {
    try {
      final data =
          await HttpUtil().post(ApiConstants.login, data: params.toJson());
      return LoginResponseEntity.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> register({
    required RegisterRequestEntity params,
  }) async {
    try {
      await HttpUtil().post(ApiConstants.register, data: params.toJson());
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    try {
      // Gửi yêu cầu logout tới API
      await HttpUtil().post(ApiConstants.logout, data: {});

      // Xóa thông tin token khỏi bộ nhớ cục bộ
      await Global.storageService.clearTokens();
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
