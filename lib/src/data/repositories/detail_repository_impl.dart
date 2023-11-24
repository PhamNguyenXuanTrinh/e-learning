//detail_repository_impl.dart
// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/error/api_error.dart';
import '../../core/error/error_codes.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/detail_model.dart';
import '../../domain/repositories/detail_repository.dart';
import '../datasources/remote/detail_course_api_service.dart';


@LazySingleton(as: DetailCourseRepository)
class DetailCourseRepositoryImpl implements DetailCourseRepository {
  DetailCourseRepositoryImpl(
    this._detailCourseApiService,
  );

  final DetailCourseApiService _detailCourseApiService;

@override
  Future<DataState<DetailModel>?> getDetailCourses() async {
    try {
      final httpResponse = await _detailCourseApiService.getDetailCourses(isMockUp: true);
      if (httpResponse.response.statusCode != HttpStatus.ok) {
        return DataFailure(httpResponse.apiError);
      }
      if (httpResponse.data?.error == ErrorCodes.success) {
        return DataSuccess(httpResponse.data?.data);
      }

      return DataFailure(httpResponse.apiError);
    } on DioException catch (e) {
      return DataFailure(ApiError(message: e.message));
    }
  }

}
