import 'package:elearning/src/domain/models/course_model.dart';
import 'package:elearning/src/domain/repositories/course_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';

part 'course_event.dart';
part 'course_state.dart';

@injectable
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc(
    this._courseRepository,
  ) : super(CourseInitial()) {
    on<CourseStarted>(_onCourseStartedHandler);
  }
  final CourseRepository _courseRepository;

  Future<void> _onCourseStartedHandler(
    final CourseStarted event,
    final Emitter<CourseState> emit,
  ) async {
    emit(CourseInProgress());
    final dataState = await _courseRepository.getCourses();
    if (dataState is DataSuccess) {
      emit(
        CourseLoadSuccess(
          course: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        CourseLoadFailure(
          ApiError(
              code: dataState.error?.code, message: dataState.error?.message),
        ),
      );
    }
  }
}
