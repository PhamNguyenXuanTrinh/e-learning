// Package imports:
import 'package:dio/dio.dart';
import 'package:elearning/src/core/utils/constants/app_config.dart';
import 'package:elearning/src/data/datasources/remote/clock_api_service.dart';
import 'package:elearning/src/data/datasources/remote/course_api_service.dart';
import 'package:elearning/src/data/datasources/remote/detail_course_api_service.dart';
import 'package:elearning/src/data/datasources/remote/home_api_service.dart';
import 'package:elearning/src/data/datasources/remote/my_course_api_service.dart';
import 'package:injectable/injectable.dart';

// Project imports:

import '../core/network/network/network.dart';
import '../data/datasources/remote/message_api_service.dart';
import '../data/datasources/remote/notification_api_service.dart';
import '../data/datasources/remote/payment_api_service.dart';
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
  @lazySingleton
  MessageApiService messageApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      MessageApiService(
        dio,
        baseUrl: url,
      );

  @lazySingleton
  NotificationApiService notificationApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      NotificationApiService(
        dio,
        baseUrl: url,
      );
  @lazySingleton
  DetailCourseApiService detailCourseApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      DetailCourseApiService(
        dio,
        baseUrl: url,
      );
  @lazySingleton
  HomeApiService homeApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      HomeApiService(
        dio,
        baseUrl: url,
      );
  @lazySingleton
  ClockApiService clockApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      ClockApiService(
        dio,
        baseUrl: url,
      );

  @lazySingleton
  PaymentApiService paymentApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      PaymentApiService(
        dio,
        baseUrl: url,
      );
  @lazySingleton
  MyCourseApiService myCourseApiService(
    @Named(AppConfig.apiDio) final Dio dio,
    @Named(AppConfig.apiBaseUrl) final String url,
  ) =>
      MyCourseApiService(
        dio,
        baseUrl: url,
      );
  //RegisterNewModule
}
