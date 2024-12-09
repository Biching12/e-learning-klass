import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';

class UserAPI {
  static Future<LoginResponseEntity> login(
      {required LoginRequestEntity params}) async {
    try {
      final data = await HttpUtil().post('/auth/login', data: params.toJson());
      return LoginResponseEntity.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> register({
    required RegisterRequestEntity params,
  }) async {
    try {
      await HttpUtil().post('/auth/register', data: params.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
