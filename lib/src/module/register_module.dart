// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/utils/constants/app_config.dart';
import 'package:elearning/src/data/datasources/remote/course_api_service.dart';
import 'package:injectable/injectable.dart';

// Project imports:

import '../core/network/network/network.dart';
import '../injector/injector.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Network get network => Network(
        enableLogger: true,
        getHeadersApiProvider: () async => <String, dynamic>{},
      );
  // register named for api services
  @Named(AppConfig.apiDio)
  Dio get apiDio => getIt<Network>().apiProvider.apiDio;
  @Named(AppConfig.apiBaseUrl)
  String get apiBaseUrl => getIt<Network>().apiProvider.apiDio.options.baseUrl;

  // =================== Api Services ========================
  @lazySingleton
  CourseApiService courseApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      CourseApiService(
        dio,
        baseUrl: url,
      );

  //RegisterNewModule
}
