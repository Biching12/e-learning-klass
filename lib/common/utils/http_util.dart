import 'package:dio/dio.dart';
import 'package:e_learning_klass/common/values/constant.dart';
import 'package:e_learning_klass/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    // Initialize the first time to talk with server
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        "Content-Type": "application/json",
      },
      // contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = Global.storageService.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handle) {
        return handle.next(response);
      },
      onError: (error, handler) {
        // Xử lý lỗi mạng hoặc lỗi API cụ thể ở đây
        if (error.response != null) {
          // Xử lý lỗi phản hồi
          print('Error response: ${error.response?.data}');
        } else {
          print('Error: ${error.message}');
        }
        return handler.next(error);
      },
    ));
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    print("My response data is ${response.toString()}");
    // print("My status code is ${response.statusCode.toString()}");
    return response.data;
  }
}
