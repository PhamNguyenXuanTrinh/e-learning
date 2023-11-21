part of 'course_bloc.dart';

@immutable
abstract class CourseState extends Equatable {
  const CourseState();
  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseInProgress extends CourseState {}

class CourseLoadSuccess extends CourseState {
  const CourseLoadSuccess({
    this.course,
  });
  final List<CourseModel>? course;

  @override
  List<Object?> get props => [
        course,
      ];
}

class CourseLoadFailure extends CourseState {
  const CourseLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
