class MyCourseResponseModel {
  final int status;
  final int error;
  final String message;
  final MyCourseModel data;

  MyCourseResponseModel({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory MyCourseResponseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseResponseModel(
      status: json['status'] ?? 0,
      error: json['error'] ?? 0,
      message: json['message'] ?? "",
      data: MyCourseModel.fromJson(json['data'] ?? {}),
    );
  }
}

class MyCourseModel {
  final MyCourseLearnedModel learnedToday;
  final List<MyCourseLearningModel> learning;

  MyCourseModel({
    required this.learnedToday,
    required this.learning,
  });

  factory MyCourseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseModel(
      learnedToday: MyCourseLearnedModel.fromJson(json['learnedToday'] ?? {}),
      learning: (json['learning'] as List<dynamic>?)
              ?.map((e) => MyCourseLearningModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class MyCourseLearnedModel {
  final String learnedTodayText;
  final int timeStudied;
  final int timeGoals;

  MyCourseLearnedModel({
    required this.learnedTodayText,
    required this.timeStudied,
    required this.timeGoals,
  });

  factory MyCourseLearnedModel.fromJson(Map<String, dynamic> json) {
    return MyCourseLearnedModel(
      learnedTodayText: json['learned_today_text'] ?? "",
      timeStudied: json['time_studied'] ?? 0,
      timeGoals: json['time_goals'] ?? 0,
    );
  }
}

class MyCourseLearningModel {
  final String titleMyCourseTab;
  final String completedText;
  final int studiedVideos;
  final int totalVideos;

  MyCourseLearningModel({
    required this.titleMyCourseTab,
    required this.completedText,
    required this.studiedVideos,
    required this.totalVideos,
  });

  factory MyCourseLearningModel.fromJson(Map<String, dynamic> json) {
    return MyCourseLearningModel(
      titleMyCourseTab: json['title_my_course_tab'] ?? "",
      completedText: json['completed_text'] ?? "",
      studiedVideos: json['studied_videos'] ?? 0,
      totalVideos: json['total_videos'] ?? 0,
    );
  }
}
