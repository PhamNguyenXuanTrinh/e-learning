// payment_repository_impl.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:elearning/src/core/error/api_error.dart';
import 'package:elearning/src/core/error/error_codes.dart';
import 'package:elearning/src/core/extensions/dio_http_response.dart';
import 'package:elearning/src/core/resources/data_state.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/payment_model.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/remote/payment_api_service.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentApiService _paymentApiService;

  PaymentRepositoryImpl(this._paymentApiService);

  @override
  Future<DataState<PaymentModel>?> getPayments() async {
    try {
      final httpResponse = await _paymentApiService.getPayments(isMockUp: true);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data?.data);
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
