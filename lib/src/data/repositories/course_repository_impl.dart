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
import '../../domain/models/course_model.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/remote/course_api_service.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  CourseRepositoryImpl(
    this._courseApiService,
  );

  final CourseApiService _courseApiService;

  @override
  Future<DataState<List<CourseModel>?>> getCourses() async {
    try {
      final httpResponse = await _courseApiService.getCourses(isMockUp: true);

      if (httpResponse.response.statusCode != HttpStatus.ok) {
        return DataSuccess(httpResponse.data?.data);
      }
      if (httpResponse.data?.error != ErrorCodes.success) {
        return DataSuccess(httpResponse.data?.data);
      }

      return DataFailure(httpResponse.apiError);
    } on DioException catch (e) {
      return DataFailure(ApiError(message: e.message));
    }
  }
}
