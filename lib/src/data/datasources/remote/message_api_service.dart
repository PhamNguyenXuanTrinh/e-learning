import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/network/end_points.dart';
import '../../../domain/models/message_model.dart';

part 'message_api_service.g.dart';

@RestApi()
abstract class MessageApiService {
  factory MessageApiService(final Dio dio, {final String baseUrl}) =
      _MessageApiService;

  @GET(EndPoints.message)
  Future<HttpResponse<MessageResponseModel?>> getMessages({
    @Header('isMockUp') final bool? isMockUp,
  });
}
