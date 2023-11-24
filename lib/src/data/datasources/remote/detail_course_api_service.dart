//detail_course_api_service.dart
// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/detail_model.dart';

part 'detail_course_api_service.g.dart';

@RestApi()
abstract class DetailCourseApiService {
  factory DetailCourseApiService(final Dio dio, {final String baseUrl}) =
      _DetailCourseApiService;

  @GET(EndPoints.detail)
  Future<HttpResponse<CourseDetailResponseModel?>> getDetailCourses({
    @Header('isMockUp') final bool? isMockUp,
    //@Path('id')  final String id, 
  });
}