class RefreshTokenResponseEntity {
  final bool? success;
  final RefreshTokenDataEntity? data;

  RefreshTokenResponseEntity({
    this.success,
    this.data,
  });

  factory RefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponseEntity(
      success: json['success'],
      data: json['data'] != null
          ? RefreshTokenDataEntity.fromJson(json['data'])
          : null,
    );
  }
}

class RefreshTokenDataEntity {
  final String accessToken;
  final int accessTokenExpireTime;
  final String tokenType;

  RefreshTokenDataEntity({
    required this.accessToken,
    required this.accessTokenExpireTime,
    required this.tokenType,
  });

  factory RefreshTokenDataEntity.fromJson(Map<String, dynamic> json) {
    return RefreshTokenDataEntity(
      accessToken: json['access_token'],
      accessTokenExpireTime: json['access_token_expire_time'] != null
          ? int.tryParse(json['access_token_expire_time'].toString()) ?? 0
          : 0,
      tokenType: json['token_type'],
    );
  }
}
