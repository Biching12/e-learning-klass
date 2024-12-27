import 'package:dio/dio.dart';
import 'package:e_learning_klass/common/entities/refresh_token.dart';
import 'package:e_learning_klass/common/routes/names.dart';

import 'package:e_learning_klass/common/values/api_constants.dart';
import 'package:e_learning_klass/common/values/constant.dart';
import 'package:e_learning_klass/global.dart';
import 'package:flutter/material.dart';

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
        int? expiredTime = Global.storageService.getAccessTokenExpireTime();
        String? refreshToken = Global.storageService.getRefreshToken();

        //convert expiredTime type int to String
        String expiredTimeString = expiredTime.toString();

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
              expiredTimeString); // Try to parse the expiredTime string
        } catch (e) {
          // print("Invalid expired time format: $expiredTime");
          return handler
              .next(options); // Skip the request if the expiredTime is invalid
        }
        final isExpired = DateTime.now().isAfter(expiredTimeConvert);

        if (isExpired) {
          try {
            final response = await HttpUtil().post(AppAPI.refreshToken,
                data: {"refresh_token": refreshToken});

            // Parse response thành RefreshTokenResponseEntity
            final refreshResponse =
                RefreshTokenResponseEntity.fromJson(response);

            if (refreshResponse.success == true &&
                refreshResponse.data != null) {
              final refreshData = refreshResponse.data!;

              final newAccessToken = refreshData.accessToken;

              // Cập nhật accessToken và thời gian hết hạn
              options.headers['Authorization'] = "Bearer $newAccessToken";

              final expiredTime = DateTime.now().add(
                Duration(milliseconds: refreshData.accessTokenExpireTime),
              );

              // Lưu trữ vào local storage
              await Global.storageService.setString(
                  AppConstants.STORAGE_ACCESS_TOKEN, refreshData.accessToken);
              await Global.storageService.setString(
                  AppConstants.STORAGE_ACCESS_TOKEN_EXPIRE_TIME,
                  expiredTime.toString());

              // Tiếp tục request hiện tại với accessToken mới
              return handler.next(options);
            }
          } on DioException catch (error) {
            return handler.reject(error, true);
          }
        }
      },
      onResponse: (response, handle) {
        return handle.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode != 401) {
          // Nếu lỗi 401, xóa token và chuyển người dùng về màn hình đăng nhập
          await Global.storageService.clearTokens();

          print("Session expired. Redirecting to login...");

          Navigator.of(Global.navigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(
            AppRoutes.signIn,
            (Route<dynamic> route) => false,
          );
        }
        return handler.next(error);
      },
    ));
  }

  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      // Thêm headers truyền từ bên ngoài vào request (nếu có)
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      var response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      print("Error in POST request: $e");
      rethrow;
    }
  }

  Future get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      // Thêm headers truyền từ bên ngoài vào request (nếu có)
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      var response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      print("Error in GET request: $e");
      rethrow;
    }
  }
}
