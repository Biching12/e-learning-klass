import 'dart:convert';

import 'package:e_learning_klass/common/entities/current_user.dart';
import 'package:e_learning_klass/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_ACCESS_TOKEN) == null
        ? false
        : true;
  }

  CurrentUserDataEntity getCurrentUserData() {
    var currentUserData =
        _prefs.getString(AppConstants.STORAGE_CURRENT_USER) ?? "";
    if (currentUserData.isNotEmpty) {
      return CurrentUserDataEntity.fromJson(jsonDecode(currentUserData));
    }
    return CurrentUserDataEntity();
  }

  // Save all infomation token when login success
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int accessTokenExpireTime,
    required int refreshTokenExpireTime,
  }) async {
    await Future.wait([
      setString(AppConstants.STORAGE_ACCESS_TOKEN, accessToken),
      setString(AppConstants.STORAGE_REFRESH_TOKEN, refreshToken),
      setInt(
          AppConstants.STORAGE_ACCESS_TOKEN_EXPIRE_TIME, accessTokenExpireTime),
      setInt(AppConstants.STORAGE_REFRESH_TOKEN_EXPIRE_TIME,
          refreshTokenExpireTime),
    ]);
  }

  // get infor access token
  String? getAccessToken() {
    return _prefs.getString(AppConstants.STORAGE_ACCESS_TOKEN);
  }

  //get infor refresh token
  String? getRefreshToken() {
    return _prefs.getString(AppConstants.STORAGE_REFRESH_TOKEN);
  }

  int? getAccessTokenExpireTime() {
    return _prefs.getInt(AppConstants.STORAGE_ACCESS_TOKEN_EXPIRE_TIME);
  }

  int? getRefreshTokenExpireTime() {
    return _prefs.getInt(AppConstants.STORAGE_REFRESH_TOKEN_EXPIRE_TIME);
  }

  Future<void> clearTokens() async {
    await _prefs.remove(AppConstants.STORAGE_ACCESS_TOKEN);
    await _prefs.remove(AppConstants.STORAGE_REFRESH_TOKEN);
    await _prefs.remove(AppConstants.STORAGE_ACCESS_TOKEN_EXPIRE_TIME);
    await _prefs.remove(AppConstants.STORAGE_REFRESH_TOKEN_EXPIRE_TIME);
  }
}
