// ignore_for_file: public_member_api_docs, sort_constructors_first

// course_screen_models.dart
class CourseDetailResponseModel {
  const CourseDetailResponseModel(
    this.status,
    this.error,
    this.message,
    this.data,
  );
  final int? status;
  final int error;
  final String? message;
  final DetailModel? data;

  factory CourseDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailResponseModel(
      json['status'] as int?,
      json['error'] as int? ?? 0,
      json['message'] as String?,
      DetailModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class DetailModel {
  final int id;
  final String? thumbnail;
  final String? courseTitle;
  final String? courseTotalTime;
  final int totalLesson;
  final int price;
  final String? titleDesc;
  final String? desc;
  final String? buttonBuy;
  
  final String? likes;
  final String? videos;
  final List<LessonModel>? lessons;

  DetailModel({
    required this.id,
    required this.thumbnail,
    required this.courseTitle,
    required this.courseTotalTime,
    required this.totalLesson,
    required this.price,
    required this.titleDesc,
    required this.desc,
    required this.buttonBuy,
    required this.videos,
    required this.likes,
    required this.lessons,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'] as int,
      thumbnail: json['thumbnail'] as String?,
      courseTitle: json['course_title'] as String?,
      courseTotalTime: json['course_total_time'] as String?,
      totalLesson: json['total_lesson'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      titleDesc: json['title_desc'] as String?,
      desc: json['desc'] as String?,
      buttonBuy: json['buttonBuy'] as String?,
      videos: json['videos'] as String?,
      likes: json['likes'] as String?,
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class LessonModel {
  final int id;
  final String? lessonName;
  final String? lessonDuration;
  final bool isLocked;
  final String? videoCourse;
  final String? number;
  

  LessonModel({
    required this.id,
    required this.lessonName,
    required this.lessonDuration,
    required this.isLocked,
    required this.videoCourse,
    required this.number,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as int,
      lessonName: json['lesson_name'] as String?,
      lessonDuration: json['lesson_duration'] as String?,
      isLocked: json['isLocked'] as bool? ?? false,
      videoCourse: json['videoCourse'] as String,
      number: json['number'] as String,
    );
  }
}
