//detail_course_event.dart
part of 'detail_course_bloc.dart';

@immutable
abstract class DetailCourseEvent {
  const DetailCourseEvent();
}

class DetailCourseStarted extends DetailCourseEvent {}

class DetailCourseOnRegisted extends DetailCourseEvent {}
