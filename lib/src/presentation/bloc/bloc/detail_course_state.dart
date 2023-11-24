//detail_course_state.dart

part of 'detail_course_bloc.dart';

@immutable
abstract class DetailCourseState extends Equatable {
  const DetailCourseState();
  @override
  List<Object?> get props => [];
}

class DetailCourseInitial extends DetailCourseState {}

class DetailCourseInProgress extends DetailCourseState {}

class DetailCourseLoadSuccess extends DetailCourseState {
  const DetailCourseLoadSuccess({
    this.detailCourse,
  });
  final DetailModel? detailCourse;

  @override
  List<Object?> get props => [
        detailCourse,
      ];
}

class DetailCourseLoadFailure extends DetailCourseState {
  const DetailCourseLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
