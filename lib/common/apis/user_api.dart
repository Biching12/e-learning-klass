import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );

    print(response.toString());
    return UserLoginResponseEntity.fromJson(response);
  }
}
