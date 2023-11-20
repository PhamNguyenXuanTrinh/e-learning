// Project imports:
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import '../error/api_error.dart';

extension HttpResponseHelper on HttpResponse<dynamic> {
  DioException get dioError => DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
      );
  ApiError get apiError => ApiError(
        code: response.statusCode,
        message: response.statusMessage,
      );
}
