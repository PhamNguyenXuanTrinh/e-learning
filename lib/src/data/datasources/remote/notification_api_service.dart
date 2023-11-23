import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/notification_model.dart';




part 'notification_api_service.g.dart';

@RestApi()
abstract class NotificationApiService {
  factory NotificationApiService(final Dio dio, {final String baseUrl}) =
      _NotificationApiService;

  @GET(EndPoints.notification)
  Future<HttpResponse<NotificationResponseModel?>> getNotifications({
    @Header('isMockUp') final bool? isMockUp,
  });
}