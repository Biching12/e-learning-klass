class ClassDetailEntity {
  final String code;
  final String name;
  final String? backgroundUrl;
  final int capacity;
  final int studentCount;
  final List<TeacherEntity> teachers;
  final List<ScheduleEntity> schedules;
  final List<LessonEntity> lessons;
  final List<StudentEntity> students;

  ClassDetailEntity({
    required this.code,
    required this.name,
    this.backgroundUrl,
    required this.capacity,
    required this.studentCount,
    required this.teachers,
    required this.schedules,
    required this.lessons,
    required this.students,
  });

  factory ClassDetailEntity.fromJson(Map<String, dynamic> json) {
    return ClassDetailEntity(
      code: json['code'],
      name: json['name'],
      backgroundUrl: json['background_url'],
      capacity: json['capacity'],
      studentCount: json['student_count'],
      teachers: (json['teachers'] as List)
          .map((e) => TeacherEntity.fromJson(e))
          .toList(),
      schedules: (json['schedules'] as List)
          .map((e) => ScheduleEntity.fromJson(e))
          .toList(),
      lessons: (json['lessons'] as List)
          .map((e) => LessonEntity.fromJson(e))
          .toList(),
      students: (json['students'] as List)
          .map((e) => StudentEntity.fromJson(e))
          .toList(),
    );
  }
}

class TeacherEntity {
  final int id;
  final String fullName;

  TeacherEntity({required this.id, required this.fullName});

  factory TeacherEntity.fromJson(Map<String, dynamic> json) {
    return TeacherEntity(id: json['id'], fullName: json['full_name']);
  }
}

class ScheduleEntity {
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  ScheduleEntity({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) {
    return ScheduleEntity(
      dayOfWeek: json['day_of_week'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}

class LessonEntity {
  final String topic;
  final String note;
  final List<FileEntity> files;

  LessonEntity({
    required this.topic,
    required this.note,
    required this.files,
  });

  factory LessonEntity.fromJson(Map<String, dynamic> json) {
    return LessonEntity(
      topic: json['topic'],
      note: json['note'],
      files:
          (json['files'] as List).map((e) => FileEntity.fromJson(e)).toList(),
    );
  }
}

class FileEntity {
  final String name;
  final String type;
  final String url;

  FileEntity({required this.name, required this.type, required this.url});

  factory FileEntity.fromJson(Map<String, dynamic> json) {
    return FileEntity(
      name: json['name'],
      type: json['type'],
      url: json['url'],
    );
  }
}

class StudentEntity {
  final int id;
  final String? avatarUrl;

  StudentEntity({required this.id, this.avatarUrl});

  factory StudentEntity.fromJson(Map<String, dynamic> json) {
    return StudentEntity(id: json['id'], avatarUrl: json['avatar_url']);
  }
}
