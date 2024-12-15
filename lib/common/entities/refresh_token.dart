class AuthRefreshResponse {
  final String accessToken;
  final int accessTokenExpireTime;
  final String tokenType;

  AuthRefreshResponse({
    required this.accessToken,
    required this.accessTokenExpireTime,
    required this.tokenType,
  });

  // Tạo phương thức fromJson để parse JSON trả về từ API
  factory AuthRefreshResponse.fromJson(Map<String, dynamic> json) {
    return AuthRefreshResponse(
      accessToken: json['access_token'],
      accessTokenExpireTime: int.parse(json['access_token_expire_time']),
      tokenType: json['token_type'],
    );
  }
}
