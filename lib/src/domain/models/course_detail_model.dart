//course_screen_models.dart

class CourseDetailModel {
  final int id;
  final String titleDetail;
  final String contentDetail;
  final String contentIntroduction;
  final int moneyDetail;
  final String nameCourse;
  final String endDay;
  final String textDetail;
  final String numericalOrder;
  final String buttonDetail;
  final String video;

  CourseDetailModel({
    required this.id,
    required this.titleDetail,
    required this.contentDetail,
    required this.contentIntroduction,
    required this.moneyDetail,
    required this.nameCourse,
    required this.endDay,
    required this.numericalOrder,
    required this.buttonDetail,
    required this.textDetail,
    required this.video,
  });
}
