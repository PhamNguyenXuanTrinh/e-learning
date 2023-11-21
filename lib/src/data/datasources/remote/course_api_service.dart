// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/course_model.dart';

part 'course_api_service.g.dart';

@RestApi()
abstract class CourseApiService {
  factory CourseApiService(final Dio dio, {final String baseUrl}) =
      _CourseApiService;

  @GET(EndPoints.course)
  Future<HttpResponse<CourseResponseModel?>> getCourses({
    @Header('isMockUp') final bool? isMockUp,
  });
}
