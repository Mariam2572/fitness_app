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

import '../../feature/login/data/data_source/login_remote_data_source.dart'
    as _i693;
import '../../feature/login/data/data_source/login_remote_data_source_imp.dart'
    as _i69;
import '../../feature/login/data/repository_implementation/login_repository_implementation.dart'
    as _i708;
import '../../feature/login/domain/repository_icontract/login_contract.dart'
    as _i21;
import '../../feature/login/domain/usecases/login_usecase.dart' as _i473;
import '../../features/auth/register/data/data_source/register_data_source_impl.dart'
    as _i932;
import '../../features/auth/register/data/repos/register_repo_impl.dart'
    as _i566;
import '../../features/auth/register/domain/repos/data_source/register_data_source.dart'
    as _i992;
import '../../features/auth/register/domain/repos/register_repo.dart' as _i369;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
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
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i785.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i693.LoginRemoteDataSource>(
      () => _i69.LoginRemoteDataSourceImp(apiService: gh<_i785.ApiService>()),
    );
    gh.factory<_i21.LoginContract>(
      () => _i708.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i693.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i992.RegisterDataSource>(
      () => _i932.RegisterDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i473.LoginUsecase>(
      () => _i473.LoginUsecase(login_repo: gh<_i21.LoginContract>()),
    );
    gh.factory<_i369.RegisterRepo>(
      () => _i566.RegisterRepoImpl(gh<_i992.RegisterDataSource>()),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(gh<_i369.RegisterRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}
