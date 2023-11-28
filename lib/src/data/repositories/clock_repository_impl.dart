// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/error/error_codes.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/clock_model.dart';
import '../../domain/repositories/clock_repository.dart';
import '../datasources/remote/clock_api_service.dart';


@LazySingleton(as: ClockRepository)
class ClockRepositoryImpl implements ClockRepository {
  ClockRepositoryImpl(
    this._clockApiService,
  );

  final ClockApiService _clockApiService;

  @override
  Future<DataState<ClockModel>?> getClocks() async {
    try {
      final httpResponse = await _clockApiService.getClocks(isMockUp: true);
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