class AddStudentRequestEntity {
  final String email;

  AddStudentRequestEntity({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class AddStudentResponseEntity {
  final bool success;

  AddStudentResponseEntity({required this.success});

  factory AddStudentResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddStudentResponseEntity(
      success: json['success'] as bool,
    );
  }
}

class AllStudentsResponseEntity {
  final bool success;
  final AllStudentsData data;

  AllStudentsResponseEntity({
    required this.success,
    required this.data,
  });

  factory AllStudentsResponseEntity.fromJson(Map<String, dynamic> json) {
    return AllStudentsResponseEntity(
      success: json['success'] as bool,
      data: AllStudentsData.fromJson(json['data']),
    );
  }
}

class AllStudentsData {
  final List<Student> items;
  final Pagination meta;

  AllStudentsData({
    required this.items,
    required this.meta,
  });

  factory AllStudentsData.fromJson(Map<String, dynamic> json) {
    return AllStudentsData(
      items: (json['items'] as List<dynamic>)
          .map((item) => Student.fromJson(item as Map<String, dynamic>))
          .toList(),
      meta: Pagination.fromJson(json['meta']),
    );
  }
}

class Student {
  final int id;
  final String fullName;
  final String? avatarUrl;

  Student({
    required this.id,
    required this.fullName,
    this.avatarUrl,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );
  }
}

class Pagination {
  final int page;
  final int perPage;
  final int itemCount;
  final int pageCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  Pagination({
    required this.page,
    required this.perPage,
    required this.itemCount,
    required this.pageCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      itemCount: json['item_count'] as int,
      pageCount: json['page_count'] as int,
      hasPreviousPage: json['has_previous_page'] as bool,
      hasNextPage: json['has_next_page'] as bool,
    );
  }
}
