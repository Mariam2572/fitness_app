// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api_manager/api_manager.dart' as _i266;
import '../api_manager/api_services.dart' as _i785;
import '../api_manager/dio_module.dart' as _i591;
import '../utils/helper/secure_storage.dart' as _i410;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i410.SecureStorageService>(
      () => _i410.SecureStorageService(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i410.SecureStorageService>(),
      ),
    );
    gh.singleton<_i266.ApiManager>(
      () => _i266.ApiManager(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i785.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}
