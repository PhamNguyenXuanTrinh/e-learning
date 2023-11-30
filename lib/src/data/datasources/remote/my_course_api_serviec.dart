// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/domain/models/my_course_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';

part 'my_course_api_service.g.dart';

@RestApi()
abstract class MyCourseApiService {
  factory MyCourseApiService(final Dio dio, {final String baseUrl}) =
    _MyCourseApiService;

  @GET(EndPoints.home)
  Future<HttpResponse<MyCourseResponseModel?>> getMyCourseScreen({
    @Header('isMockUp') final bool? isMockUp,
  });
}
