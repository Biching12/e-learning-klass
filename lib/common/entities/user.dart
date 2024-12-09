import 'package:intl/intl.dart';

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
  final String? accessToken;
  final String? refreshToken;
  final String? accessTokenExpireTime;
  final String? refreshTokenExpireTime;
  final String? tokenType;

  LoginResponseEntity({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpireTime,
    this.refreshTokenExpireTime,
    this.tokenType,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return LoginResponseEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      accessTokenExpireTime: json['access_token_expire_time'],
      refreshTokenExpireTime: json['refresh_token_expire_time'],
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
