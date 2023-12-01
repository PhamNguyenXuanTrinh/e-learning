part of 'my_course_bloc.dart';

@immutable
abstract class MyCourseEvent {
  const MyCourseEvent();
}

class MyCourseStarted extends MyCourseEvent {}

class MyCourseOnRegistered extends MyCourseEvent {

}