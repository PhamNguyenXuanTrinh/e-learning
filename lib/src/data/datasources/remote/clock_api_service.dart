// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/clock_model.dart';

part 'clock_api_service.g.dart';

@RestApi()
abstract class ClockApiService {
  factory ClockApiService(final Dio dio, {final String baseUrl}) =
      _ClockApiService;

  @GET(EndPoints.clock)
  Future<HttpResponse<ClockResponseModel?>> getClocks({
    @Header('isMockUp') final bool? isMockUp,
  });
}