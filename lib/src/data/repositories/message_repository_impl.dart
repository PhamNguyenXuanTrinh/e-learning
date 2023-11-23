// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/api_error.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/message_model.dart';
import '../../domain/repositories/message_repository.dart';
import '../datasources/remote/message_api_service.dart';


@LazySingleton(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl(
    this._messageApiService,
  );

  final MessageApiService _messageApiService;

  @override
  Future<DataState<List<MessageModel>?>> getMessages() async {
    try {
      final httpResponse = await _messageApiService.getMessages(isMockUp: true);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data?.data);
      }

      return DataFailure(httpResponse.apiError);
    } on DioException catch (e) {
      return DataFailure(ApiError(message: e.message));
    }
  }
}
