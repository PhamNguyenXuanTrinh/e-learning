import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/payment_model.dart';

part 'payment_api_service.g.dart';

@RestApi()
abstract class PaymentApiService {
  factory PaymentApiService(final Dio dio, {final String baseUrl}) =
      _PaymentApiService;

  @GET(EndPoints.payment)
  Future<HttpResponse<PaymentResponseModel?>> getPayments({
    @Header('isMockUp') final bool? isMockUp,
  });
}