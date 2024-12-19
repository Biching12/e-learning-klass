class LoginRequestEntity {
  final String email;
  final String password;

  LoginRequestEntity({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class LoginResponseEntity {
  final bool? success;
  final LoginDataEntity? data;

  LoginResponseEntity({
    this.success,
    this.data,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return LoginResponseEntity(
      success: json['success'],
      data:
          json['data'] != null ? LoginDataEntity.fromJson(json['data']) : null,
    );
  }
}

class LoginDataEntity {
  final String? accessToken;
  final String? refreshToken;
  final int? accessTokenExpireTime;
  final int? refreshTokenExpireTime;
  final String? tokenType;

  LoginDataEntity({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpireTime,
    this.refreshTokenExpireTime,
    this.tokenType,
  });

  factory LoginDataEntity.fromJson(Map<String, dynamic> json) {
    return LoginDataEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      accessTokenExpireTime: json['access_token_expire_time'] != null
          ? int.tryParse(json['access_token_expire_time'].toString())
          : null, // Chuyển đổi sang int
      refreshTokenExpireTime: json['refresh_token_expire_time'] != null
          ? int.tryParse(json['refresh_token_expire_time'].toString())
          : null, // Chuyển đổi sang int
      tokenType: json['token_type'],
    );
  }
}

class RegisterRequestEntity {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;

  RegisterRequestEntity({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth,
      'gender': gender,
    };
  }
}

class RegisterResponseEntity {
  final bool? success;

  RegisterResponseEntity({
    this.success,
  });

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) {
    return RegisterResponseEntity(
      success: json['success'],
    );
  }
}
