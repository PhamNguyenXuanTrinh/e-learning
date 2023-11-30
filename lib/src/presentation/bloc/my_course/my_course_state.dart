part of 'my_course_bloc.dart';

@immutable
abstract class MyCourseState extends Equatable {
  const MyCourseState();
  @override
  List<Object?> get props => [];
}

class MyCourseInitial extends MyCourseState {}

class MyCourseInProgress extends MyCourseState {}

class MyCourseLoadSuccess extends MyCourseState {
  const MyCourseLoadSuccess({
    this.mycourseData,
  });
  final MyCourseModel? mycourseData;

  @override
  List<Object?> get props => [
        mycourseData,
      ];
}

class MyCourseLoadFailure extends MyCourseState {
  const MyCourseLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}