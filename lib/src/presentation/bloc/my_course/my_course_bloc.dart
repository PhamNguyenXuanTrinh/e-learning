import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/my_course_model.dart';

import '../../../domain/repositories/my_course_repository.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

@injectable
class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  MyCourseBloc(
    this._mycourseRepository,
  ) : super(MyCourseInitial()) {
    on<MyCourseStarted>(_onMyCourseStartedHandler);
  }
  final MyCourseRepository _mycourseRepository;

  Future<void> _onMyCourseStartedHandler(
    final MyCourseStarted event,
    final Emitter<MyCourseState> emit,
  ) async {
    emit(MyCourseInProgress());
    final dataState = await _mycourseRepository.getMyCourseScreen();
    if (dataState is DataSuccess) {
      emit(
        MyCourseLoadSuccess(
          mycourseData: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        MyCourseLoadFailure(
          ApiError(
              code: dataState.error?.code, message: dataState.error?.message),
        ),
      );
    }
  }
}