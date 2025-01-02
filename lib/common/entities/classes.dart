class ClassroomRequestEntity {
  String name;
  int capacity;
  String tuitionFee;
  String startDate;
  String endDate;
  List<Schedule> schedules;

  ClassroomRequestEntity({
    required this.name,
    required this.capacity,
    required this.tuitionFee,
    required this.startDate,
    required this.endDate,
    required this.schedules,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capacity': capacity,
      'tuition_fee': tuitionFee,
      'start_date': startDate,
      'end_date': endDate,
      'schedules': schedules.map((schedule) => schedule.toJson()).toList(),
    };
  }
}

class Schedule {
  int dayOfWeek;
  String startTime;
  String endTime;

  Schedule({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'day_of_week': dayOfWeek,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}

class CreateClassroomResponseEntity {
  bool success;

  CreateClassroomResponseEntity({
    required this.success,
  });

  factory CreateClassroomResponseEntity.fromJson(Map<String, dynamic> json) {
    return CreateClassroomResponseEntity(
      success: json['success'],
    );
  }
}

class ClassroomResponseEntity {
  final bool success;
  final List<ClassroomDataEntity> items;
  final MetaDataEntity meta;

  ClassroomResponseEntity({
    required this.success,
    required this.items,
    required this.meta,
  });
  factory ClassroomResponseEntity.fromJson(Map<String, dynamic> json) {
    return ClassroomResponseEntity(
      success: json['success'] as bool,
      items: (json['data']['items'] as List<dynamic>)
          .map((item) =>
              ClassroomDataEntity.fromJson(item as Map<String, dynamic>))
          .toList(),
      meta:
          MetaDataEntity.fromJson(json['data']['meta'] as Map<String, dynamic>),
    );
  }
}

class ClassroomDataEntity {
  final int id;
  final String name;
  final String teacherName;

  ClassroomDataEntity({
    required this.id,
    required this.name,
    required this.teacherName,
  });

  factory ClassroomDataEntity.fromJson(Map<String, dynamic> json) {
    return ClassroomDataEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      teacherName: json['teacher_name'] as String,
    );
  }
}

class MetaDataEntity {
  final int page;
  final int perPage;
  final int itemCount;
  final int pageCount;
  final bool hasPreviousPage;
  final bool hasNextPage;

  MetaDataEntity(
      {required this.page,
      required this.perPage,
      required this.itemCount,
      required this.pageCount,
      required this.hasPreviousPage,
      required this.hasNextPage});

  factory MetaDataEntity.fromJson(Map<String, dynamic> json) {
    return MetaDataEntity(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      itemCount: json['item_count'] as int,
      pageCount: json['page_count'] as int,
      hasPreviousPage: json['has_previous_page'] as bool,
      hasNextPage: json['has_next_page'] as bool,
    );
  }
}
