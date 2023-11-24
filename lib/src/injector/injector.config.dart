// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:elearning/src/core/network/network/network.dart' as _i4;
import 'package:elearning/src/data/datasources/remote/course_api_service.dart'
    as _i5;
import 'package:elearning/src/data/datasources/remote/detail_course_api_service.dart'
    as _i8;
import 'package:elearning/src/data/datasources/remote/message_api_service.dart'
    as _i11;
import 'package:elearning/src/data/datasources/remote/notification_api_service.dart'
    as _i14;
import 'package:elearning/src/data/repositories/course_repository_impl.dart'
    as _i7;
import 'package:elearning/src/data/repositories/detail_repository_impl.dart'
    as _i10;
import 'package:elearning/src/data/repositories/message_repository_impl.dart'
    as _i13;
import 'package:elearning/src/data/repositories/notification_repository_impl.dart'
    as _i16;
import 'package:elearning/src/domain/repositories/course_repository.dart'
    as _i6;
import 'package:elearning/src/domain/repositories/detail_repository.dart'
    as _i9;
import 'package:elearning/src/domain/repositories/message_repository.dart'
    as _i12;
import 'package:elearning/src/domain/repositories/notification_repository.dart'
    as _i15;
import 'package:elearning/src/module/register_module.dart' as _i21;
import 'package:elearning/src/presentation/bloc/bloc/detail_course_bloc.dart'
    as _i18;
import 'package:elearning/src/presentation/bloc/course_bloc/course_bloc.dart'
    as _i17;
import 'package:elearning/src/presentation/bloc/message/message_bloc.dart'
    as _i19;
import 'package:elearning/src/presentation/bloc/notification/notification_bloc.dart'
    as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(
      () => registerModule.apiDio,
      instanceName: 'apiDio',
    );
    gh.lazySingleton<_i4.Network>(() => registerModule.network);
    gh.factory<String>(
      () => registerModule.apiBaseUrl,
      instanceName: 'apiBaseUrl',
    );
    gh.lazySingleton<_i5.CourseApiService>(
        () => registerModule.courseApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i6.CourseRepository>(
        () => _i7.CourseRepositoryImpl(gh<_i5.CourseApiService>()));
    gh.lazySingleton<_i8.DetailCourseApiService>(
        () => registerModule.detailCourseApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i9.DetailCourseRepository>(() =>
        _i10.DetailCourseRepositoryImpl(gh<_i8.DetailCourseApiService>()));
    gh.lazySingleton<_i11.MessageApiService>(
        () => registerModule.messageApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i12.MessageRepository>(
        () => _i13.MessageRepositoryImpl(gh<_i11.MessageApiService>()));
    gh.lazySingleton<_i14.NotificationApiService>(
        () => registerModule.notificationApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i15.NotificationRepository>(() =>
        _i16.NotificationRepositoryImpl(gh<_i14.NotificationApiService>()));
    gh.factory<_i17.CourseBloc>(
        () => _i17.CourseBloc(gh<_i6.CourseRepository>()));
    gh.factory<_i18.DetailCourseBloc>(
        () => _i18.DetailCourseBloc(gh<_i9.DetailCourseRepository>()));
    gh.factory<_i19.MessageBloc>(
        () => _i19.MessageBloc(gh<_i12.MessageRepository>()));
    gh.factory<_i20.NotificationBloc>(
        () => _i20.NotificationBloc(gh<_i15.NotificationRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
