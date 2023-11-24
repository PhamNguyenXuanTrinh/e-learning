//api_provider
// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../utils/constants/app_config.dart';
import '../interceptors/header_interceptor.dart';
import '../interceptors/mockup_interceptor.dart';

class ApiProvider {
  ApiProvider({
    required this.enableLogger,
    required this.baseUrl,
    required this.getHeaders,
  }) {
    final dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = AppConfig.connectTimeout
      ..receiveTimeout = AppConfig.receiveTimeout
      ..contentType = Headers.jsonContentType;

    apiDio = Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }
  }
  late Dio apiDio;
  bool enableLogger;
  String baseUrl;
  Future<Map<String, dynamic>> Function() getHeaders;
}
