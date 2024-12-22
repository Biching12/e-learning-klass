class CurrentUserEntity {
  final bool success;
  final CurrentUserDataEntity? data;

  CurrentUserEntity({
    required this.success,
    this.data,
  });

  factory CurrentUserEntity.fromJson(Map<String, dynamic> json) {
    return CurrentUserEntity(
      success: json['success'],
      data: json['data'] != null
          ? CurrentUserDataEntity.fromJson(json['data'])
          : null,
    );
  }
}

class CurrentUserDataEntity {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;
  final String? role;

  CurrentUserDataEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.role,
  });

  factory CurrentUserDataEntity.fromJson(Map<String, dynamic> json) {
    return CurrentUserDataEntity(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatarUrl: json['avatar_url'],
      role: json['role'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar_url': avatarUrl,
      'role': role,
    };
  }
}
