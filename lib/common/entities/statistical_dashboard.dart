class DashboardEntity {
  final bool success;
  final DashboardData data;

  DashboardEntity({
    required this.success,
    required this.data,
  });

  factory DashboardEntity.fromJson(Map<String, dynamic> json) {
    return DashboardEntity(
      success: json['success'],
      data: DashboardData.fromJson(json['data']),
    );
  }
}

class DashboardData {
  final String studentCount;
  final String teacherCount;
  final String classroomCount;
  final String todayClassroomCount;
  final List<TodayClassroom> todayClassrooms;

  DashboardData({
    required this.studentCount,
    required this.teacherCount,
    required this.classroomCount,
    required this.todayClassroomCount,
    required this.todayClassrooms,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      studentCount: json['student_count'],
      teacherCount: json['teacher_count'],
      classroomCount: json['classroom_count'],
      todayClassroomCount: json['today_classroom_count'],
      todayClassrooms: (json['today_classrooms'] as List)
          .map((e) => TodayClassroom.fromJson(e))
          .toList(),
    );
  }
}

class TodayClassroom {
  final int id;
  final String name;
  final String teacherName;

  TodayClassroom({
    required this.id,
    required this.name,
    required this.teacherName,
  });

  factory TodayClassroom.fromJson(Map<String, dynamic> json) {
    return TodayClassroom(
      id: json['id'],
      name: json['name'],
      teacherName: json['teacher_name'],
    );
  }
}
