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
import 'package:elearning/src/data/repositories/course_repository_impl.dart'
    as _i7;
import 'package:elearning/src/domain/repositories/course_repository.dart'
    as _i6;
import 'package:elearning/src/module/register_module.dart' as _i9;
import 'package:elearning/src/presentation/bloc/course_bloc/course_bloc.dart'
    as _i8;
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
    gh.factory<_i8.CourseBloc>(
        () => _i8.CourseBloc(gh<_i6.CourseRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
