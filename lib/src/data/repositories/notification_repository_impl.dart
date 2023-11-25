// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/error/error_codes.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/notification_model.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/remote/notification_api_service.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(
    this._notificationApiService,
  );

  final NotificationApiService _notificationApiService;

  @override
  Future<DataState<List<NotificationModel>?>> getNotifications() async {
    try {
      final httpResponse =
          await _notificationApiService.getNotifications(isMockUp: true);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
