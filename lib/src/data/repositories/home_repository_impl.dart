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
import '../../domain/models/home_model.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_api_service.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(
    this._homeApiService,
  );

  final HomeApiService _homeApiService;

  @override
  Future<DataState<HomeModel?>> getHomeScreen() async {
    try {
      final httpResponse = await _homeApiService.getHomeScreen(isMockUp: true);
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