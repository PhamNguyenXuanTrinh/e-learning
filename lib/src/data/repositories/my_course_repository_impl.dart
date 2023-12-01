// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/error/error_codes.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/error/api_error.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/my_course_model.dart';
import '../../domain/repositories/my_course_repository.dart';
import '../datasources/remote/my_course_api_service.dart';

@LazySingleton(as: MyCourseRepository)
class MyCourseRepositoryImpl implements MyCourseRepository {
  MyCourseRepositoryImpl(
    this._myCourseApiService,
  );

  final MyCourseApiService _myCourseApiService;

  @override
  Future<DataState<MyCourseModel>> getMyCourseScreen() async {
    try {
      final httpResponse =
          await _myCourseApiService.getMyCourseScreen(isMockUp: true);
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