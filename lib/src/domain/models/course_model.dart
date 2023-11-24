// ignore_for_file: public_member_api_docs, sort_constructors_first
//course_screen_models.dart
class CourseResponseModel {
  const CourseResponseModel(
    this.status,
    this.error,
    this.message,
    this.data,
  );
  final int? status;
  final int error;
  final String? message;
  final List<CourseModel>? data;

  factory CourseResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseResponseModel(
      json['status'] as int,
      json['error'] as int,
      json['message'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CourseModel {
  final int id;
  final String titleCourseTab;
  final String teachTab;
  final int moneyTab;
  final String timeTab;
  final String imageUrl;

  CourseModel({
    required this.id,
    required this.titleCourseTab,
    required this.teachTab,
    required this.moneyTab,
    required this.timeTab,
    required this.imageUrl,
  });
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as int,
      titleCourseTab: json['title_course_tab'] as String,
      teachTab: json['teach_tab'] as String,
      moneyTab: json['money_tab'] as int,
      timeTab: json['time_tab'] as String,
      imageUrl: json['imgUrl'] as String,
    );
  }
}
