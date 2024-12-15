import 'package:dio/dio.dart';
import 'package:e_learning_klass/common/path_apis/api_constants.dart';
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
      onRequest: (options, handler) async {
        //Configure the path to call the api
        // if (options.path.contains('http')) {
        //   options.path = AppConstants.SERVER_API_URL + ApiConstants.currentUser;
        // }
        // options.connectTimeout = const Duration(seconds: 5);
        // options.receiveTimeout = const Duration(seconds: 5);

        // Get temporarily saved tokens from local storage
        String? accessToken = Global.storageService.getAccessToken();
        String? expiredTime = Global.storageService.getAccessTokenExpireTime();
        String? refreshToken = Global.storageService.getRefreshToken();

        // Check if the user is logged in or not. If not, then call handler.next(options) to return data to the client
        if (accessToken == null ||
            expiredTime == null ||
            refreshToken == null) {
          return handler.next(options);
        }

        //Calculate token expiration time
        DateTime expiredTimeConvert;
        try {
          expiredTimeConvert = DateTime.parse(
              expiredTime); // Try to parse the expiredTime string
        } catch (e) {
          // print("Invalid expired time format: $expiredTime");
          return handler
              .next(options); // Skip the request if the expiredTime is invalid
        }
        final isExpired = DateTime.now().isAfter(expiredTimeConvert);

        if (isExpired) {
          try {
            final response = await HttpUtil().post(ApiConstants.refreshToken,
                data: {"refresh_token": refreshToken});
            if (response.statusCode == 200) {
              if (response.data["access_token"] != null) {
                options.headers['Authorization'] =
                    "Bearer ${response.data["access_token"]}";

                final expiredTime = DateTime.now().add(
                  Duration(
                      seconds:
                          int.parse(response.data["access_token_expire_time"])),
                );

                await Global.storageService.setString(
                    AppConstants.STORAGE_ACCESS_TOKEN,
                    response.data["access_token"]);
                await Global.storageService.setString(
                    AppConstants.STORAGE_ACCESS_TOKEN_EXPIRE_TIME,
                    expiredTime.toString());
              }
            }
            return handler.next(options);
          } on DioException catch (error) {
            // logout();
            // print("logout");
            return handler.reject(error, true);
          }
        } else {
          // Attach the access_token to the header, include the access_token in the header every time you call the API
          options.headers['Authorization'] = "Bearer $accessToken";
          return handler.next(options);
        }
      },
      onResponse: (response, handle) {
        return handle.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode != 401) {
          //logout if end session
          // logout();
          // print("Error: ${error.response}");
        }
        return handler.next(error);
      },
    ));
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    // print("My status code is ${response.statusCode.toString()}");
    return response.data;
  }
}
