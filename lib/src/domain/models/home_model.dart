class HomeResponseModel {
  const HomeResponseModel(
    this.status,
    this.error,
    this.message,
    this.data,
  );

  final int? status;
  final int error;
  final String? message;
  final HomeModel? data;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      json['status'] as int,
      json['error'] as int,
      json['message'] as String,
      HomeModel.fromJson(json['data'] as Map<String, dynamic>?),
    );
  }
}

class HomeModel {
  const HomeModel(
    this.info,
    this.learned,
    this.banners,
    this.learningPlan,
  );

  final HomeInfoModel info;
  final HomeLearnedModel learned;
  final List<HomeBannerModel> banners;
  final List<HomeLearningPlanModel> learningPlan;

  factory HomeModel.fromJson(Map<String, dynamic>? json) {
    return HomeModel(
      HomeInfoModel.fromJson(json?['info'] as Map<String, dynamic>?),
      HomeLearnedModel.fromJson(json?['learned'] as Map<String, dynamic>?),
      (json?['banners'] as List<dynamic>?)
              ?.map((e) => HomeBannerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json?['learning_plan'] as List<dynamic>?)
              ?.map((e) =>
                  HomeLearningPlanModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  get length => null;
}

class HomeInfoModel {
  const HomeInfoModel(
    this.name,
    this.welcomeMessage,
    this.avatar,
  );

  final String name;
  final String welcomeMessage;
  final String avatar;

  factory HomeInfoModel.fromJson(Map<String, dynamic>? json) {
    return HomeInfoModel(
      json?['name'] as String? ?? '',
      json?['welcome_message'] as String? ?? '',
      json?['avatar'] as String? ?? '',
    );
  }
}

class HomeLearnedModel {
  const HomeLearnedModel(
    this.learnedText,
    this.myCoursesText,
    this.timeStudiedToday,
    this.timeGoal,
  );

  final String learnedText;
  final String myCoursesText;
  final int timeStudiedToday;
  final int timeGoal;

  factory HomeLearnedModel.fromJson(Map<String, dynamic>? json) {
    return HomeLearnedModel(
      json?['learned_text'] as String? ?? '',
      json?['my_courses_text'] as String? ?? '',
      json?['time_studied_today'] as int? ?? 0,
      json?['time_goal'] as int? ?? 0,
    );
  }
}

class HomeBannerModel {
  const HomeBannerModel(
    this.title,
    this.thumbnail,
  );

  final String title;
  final String thumbnail;

  factory HomeBannerModel.fromJson(Map<String, dynamic>? json) {
    return HomeBannerModel(
      json?['title'] as String? ?? '',
      json?['thumbnail'] as String? ?? '',
    );
  }
}

class HomeLearningPlanModel {
  const HomeLearningPlanModel(
    this.courseName,
    this.studiedLessons,
    this.totalLessons,
  );

  final String courseName;
  final int studiedLessons;
  final int totalLessons;

  factory HomeLearningPlanModel.fromJson(Map<String, dynamic> json) {
    return HomeLearningPlanModel(
      json['course_name'] as String,
      json['studied_lessons'] as int,
      json['total_lessons'] as int,
    );
  }
}
