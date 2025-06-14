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

import '../../features/auth/register/data/data_source/register_data_source_impl.dart'
    as _i932;
import '../../features/auth/register/data/repos/register_repo_impl.dart'
    as _i566;
import '../../features/auth/register/domain/repos/data_source/register_data_source.dart'
    as _i992;
import '../../features/auth/register/domain/repos/register_repo.dart' as _i369;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
import '../api_manager/api_manager.dart' as _i266;
import '../api_manager/api_services.dart' as _i785;
import '../api_manager/dio_module.dart' as _i591;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i118.RegisterUseCase>(() => _i118.RegisterUseCase());
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i410.SecureStorageService>(
      () => _i410.SecureStorageService(),
    );
    gh.factory<_i369.RegisterRepo>(() => _i566.RegisterRepoImpl());
    gh.factory<_i992.RegisterDataSource>(() => _i932.RegisterDataSourceImpl());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i361.LogInterceptor>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}
