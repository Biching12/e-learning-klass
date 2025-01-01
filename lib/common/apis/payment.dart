import 'package:e_learning_klass/common/entities/create_order.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';

class PaymentAPI {
  static Future<CreateOrderResponseEntity> createOrder(
      {required CreateOrderRequestEntity params}) async {
    try {
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      final headers = {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      };

      final response = await HttpUtil().post(
        AppAPI.createOrder, // Replace with your PayPal order endpoint
        data: params.toJson(),
        headers: headers,
      );

      return CreateOrderResponseEntity.fromJson(response);
    } catch (e) {
      print("Error creating PayPal order: $e");
      rethrow;
    }
  }
}
