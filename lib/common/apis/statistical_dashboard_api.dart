import 'package:e_learning_klass/common/entities/statistical_dashboard.dart';
import 'package:e_learning_klass/common/utils/http_util.dart';
import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/global.dart';

class DashboardAPI {
  static Future<DashboardEntity> dashboardData() async {
    try {
      // Lấy access token từ storage service
      String? accessToken = Global.storageService.getAccessToken();

      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      // Cấu hình headers
      final Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      // Gọi API
      final response = await HttpUtil().get(
        AppAPI.statisticalDashboard,
        headers: headers,
      );

      // Map response vào entity
      return DashboardEntity.fromJson(response);
    } catch (e) {
      print("Error fetching dashboard data: $e");
      rethrow;
    }
  }
}
