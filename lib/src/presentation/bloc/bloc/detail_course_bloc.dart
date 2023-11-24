//detail_course_bloc
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/detail_model.dart';
import '../../../domain/repositories/detail_repository.dart';

part 'detail_course_event.dart';
part 'detail_course_state.dart';

@injectable
class DetailCourseBloc extends Bloc<DetailCourseEvent, DetailCourseState> {
  DetailCourseBloc(this._detailCourseRepository)
      : super(DetailCourseInitial()) {
    on<DetailCourseStarted>(_onDetailCourseStartedHandler);
  }
  final DetailCourseRepository _detailCourseRepository;
  Future<void> _onDetailCourseStartedHandler(
    final DetailCourseStarted event,
    final Emitter<DetailCourseState> emit,
  ) async {
    emit(DetailCourseInProgress());
    final dataState = await _detailCourseRepository.getDetailCourses();
    if (dataState is DataSuccess) {
      emit(
        DetailCourseLoadSuccess(
          detailCourse: dataState?.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        DetailCourseLoadFailure(
          ApiError(
              code: dataState?.error?.code, message: dataState?.error?.message),
        ),
      );
    }
  }
}
