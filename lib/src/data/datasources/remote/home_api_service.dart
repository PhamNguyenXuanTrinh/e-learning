// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/home_model.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(final Dio dio, {final String baseUrl}) =
    _HomeApiService;

  @GET(EndPoints.home)
  Future<HttpResponse<HomeResponseModel?>> getHomeScreen({
    @Header('isMockUp') final bool? isMockUp,
  });
}
