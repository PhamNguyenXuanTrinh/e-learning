// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:elearning/src/core/network/network/network.dart' as _i4;
import 'package:elearning/src/data/datasources/remote/clock_api_service.dart'
    as _i5;
import 'package:elearning/src/data/datasources/remote/course_api_service.dart'
    as _i8;
import 'package:elearning/src/data/datasources/remote/detail_course_api_service.dart'
    as _i11;
import 'package:elearning/src/data/datasources/remote/home_api_service.dart'
    as _i14;
import 'package:elearning/src/data/datasources/remote/message_api_service.dart'
    as _i17;
import 'package:elearning/src/data/datasources/remote/my_course_api_service.dart'
    as _i20;
import 'package:elearning/src/data/datasources/remote/notification_api_service.dart'
    as _i23;
import 'package:elearning/src/data/datasources/remote/payment_api_service.dart'
    as _i26;
import 'package:elearning/src/data/repositories/clock_repository_impl.dart'
    as _i7;
import 'package:elearning/src/data/repositories/course_repository_impl.dart'
    as _i10;
import 'package:elearning/src/data/repositories/detail_repository_impl.dart'
    as _i13;
import 'package:elearning/src/data/repositories/home_repository_impl.dart'
    as _i16;
import 'package:elearning/src/data/repositories/message_repository_impl.dart'
    as _i19;
import 'package:elearning/src/data/repositories/my_course_repository_impl.dart'
    as _i22;
import 'package:elearning/src/data/repositories/notification_repository_impl.dart'
    as _i25;
import 'package:elearning/src/data/repositories/payment_repositpry_impl.dart'
    as _i28;
import 'package:elearning/src/domain/repositories/clock_repository.dart' as _i6;
import 'package:elearning/src/domain/repositories/course_repository.dart'
    as _i9;
import 'package:elearning/src/domain/repositories/detail_repository.dart'
    as _i12;
import 'package:elearning/src/domain/repositories/home_repository.dart' as _i15;
import 'package:elearning/src/domain/repositories/message_repository.dart'
    as _i18;
import 'package:elearning/src/domain/repositories/my_course_repository.dart'
    as _i21;
import 'package:elearning/src/domain/repositories/notification_repository.dart'
    as _i24;
import 'package:elearning/src/domain/repositories/payment_repository.dart'
    as _i27;
import 'package:elearning/src/module/register_module.dart' as _i37;
import 'package:elearning/src/presentation/bloc/bloc/detail_course_bloc.dart'
    as _i31;
import 'package:elearning/src/presentation/bloc/clock/clock_bloc.dart' as _i29;
import 'package:elearning/src/presentation/bloc/course_bloc/course_bloc.dart'
    as _i30;
import 'package:elearning/src/presentation/bloc/home_bloc/home_bloc.dart'
    as _i32;
import 'package:elearning/src/presentation/bloc/message/message_bloc.dart'
    as _i33;
import 'package:elearning/src/presentation/bloc/my_course/my_course_bloc.dart'
    as _i34;
import 'package:elearning/src/presentation/bloc/notification/notification_bloc.dart'
    as _i35;
import 'package:elearning/src/presentation/bloc/payment_bloc/payment_bloc.dart'
    as _i36;
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
    gh.lazySingleton<_i5.ClockApiService>(() => registerModule.clockApiService(
          gh<_i3.Dio>(instanceName: 'apiDio'),
          gh<String>(instanceName: 'apiBaseUrl'),
        ));
    gh.lazySingleton<_i6.ClockRepository>(
        () => _i7.ClockRepositoryImpl(gh<_i5.ClockApiService>()));
    gh.lazySingleton<_i8.CourseApiService>(
        () => registerModule.courseApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i9.CourseRepository>(
        () => _i10.CourseRepositoryImpl(gh<_i8.CourseApiService>()));
    gh.lazySingleton<_i11.DetailCourseApiService>(
        () => registerModule.detailCourseApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i12.DetailCourseRepository>(() =>
        _i13.DetailCourseRepositoryImpl(gh<_i11.DetailCourseApiService>()));
    gh.lazySingleton<_i14.HomeApiService>(() => registerModule.homeApiService(
          gh<_i3.Dio>(instanceName: 'apiDio'),
          gh<String>(instanceName: 'apiBaseUrl'),
        ));
    gh.lazySingleton<_i15.HomeRepository>(
        () => _i16.HomeRepositoryImpl(gh<_i14.HomeApiService>()));
    gh.lazySingleton<_i17.MessageApiService>(
        () => registerModule.messageApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i18.MessageRepository>(
        () => _i19.MessageRepositoryImpl(gh<_i17.MessageApiService>()));
    gh.factory<_i20.MyCourseApiService>(() => registerModule.myCourseApiService(
          gh<_i3.Dio>(instanceName: 'apiDio'),
          gh<String>(instanceName: 'apiBaseUrl'),
        ));
    gh.lazySingleton<_i21.MyCourseRepository>(
        () => _i22.MyCourseRepositoryImpl(gh<_i20.MyCourseApiService>()));
    gh.lazySingleton<_i23.NotificationApiService>(
        () => registerModule.notificationApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i24.NotificationRepository>(() =>
        _i25.NotificationRepositoryImpl(gh<_i23.NotificationApiService>()));
    gh.lazySingleton<_i26.PaymentApiService>(
        () => registerModule.paymentApiService(
              gh<_i3.Dio>(instanceName: 'apiDio'),
              gh<String>(instanceName: 'apiBaseUrl'),
            ));
    gh.lazySingleton<_i27.PaymentRepository>(
        () => _i28.PaymentRepositoryImpl(gh<_i26.PaymentApiService>()));
    gh.factory<_i29.ClockBloc>(() => _i29.ClockBloc(gh<_i6.ClockRepository>()));
    gh.factory<_i30.CourseBloc>(
        () => _i30.CourseBloc(gh<_i9.CourseRepository>()));
    gh.factory<_i31.DetailCourseBloc>(
        () => _i31.DetailCourseBloc(gh<_i12.DetailCourseRepository>()));
    gh.factory<_i32.HomeBloc>(() => _i32.HomeBloc(gh<_i15.HomeRepository>()));
    gh.factory<_i33.MessageBloc>(
        () => _i33.MessageBloc(gh<_i18.MessageRepository>()));
    gh.factory<_i34.MyCourseBloc>(
        () => _i34.MyCourseBloc(gh<_i21.MyCourseRepository>()));
    gh.factory<_i35.NotificationBloc>(
        () => _i35.NotificationBloc(gh<_i24.NotificationRepository>()));
    gh.factory<_i36.PaymentBloc>(
        () => _i36.PaymentBloc(gh<_i27.PaymentRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i37.RegisterModule {}
