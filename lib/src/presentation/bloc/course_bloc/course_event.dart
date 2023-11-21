part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {
  const CourseEvent();
}

class CourseStarted extends CourseEvent {}

class CourseOnRegisted extends CourseEvent {}
