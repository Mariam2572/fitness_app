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

import '../../features/auth/login/data/data_source/login_remote_data_source.dart'
    as _i520;
import '../../features/auth/login/data/data_source/login_remote_data_source_imp.dart'
    as _i1015;
import '../../features/auth/login/data/repository_implementation/login_repository_implementation.dart'
    as _i268;
import '../../features/auth/login/domain/repository_icontract/login_contract.dart'
    as _i96;
import '../../features/auth/login/domain/usecases/login_usecase.dart' as _i401;
import '../../features/auth/register/data/data_source/register_data_source_impl.dart'
    as _i932;
import '../../features/auth/register/data/repos/register_repo_impl.dart'
    as _i566;
import '../../features/auth/register/domain/repos/data_source/register_data_source.dart'
    as _i992;
import '../../features/auth/register/domain/repos/register_repo.dart' as _i369;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
import '../../features/exercise/data/data_source/exercise_remote_data_source_impl.dart'
    as _i424;
import '../../features/exercise/data/repo_impl/exercise_repo_impl.dart'
    as _i824;
import '../../features/exercise/domain/data_source/exercise_remote_data_source.dart'
    as _i831;
import '../../features/exercise/domain/repos/exercise_repo.dart' as _i659;
import '../../features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart'
    as _i292;
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
    gh.factory<_i520.LoginRemoteDataSource>(
      () => _i1015.LoginRemoteDataSourceImp(apiService: gh<_i785.ApiService>()),
    );
    gh.factory<_i831.ExerciseRemoteDataSource>(
      () => _i424.ExerciseRemoteDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i96.LoginContract>(
      () => _i268.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i520.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i659.ExerciseRepo>(
      () => _i824.ExerciseRepoImpl(gh<_i831.ExerciseRemoteDataSource>()),
    );
    gh.factory<_i992.RegisterDataSource>(
      () => _i932.RegisterDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i369.RegisterRepo>(
      () => _i566.RegisterRepoImpl(gh<_i992.RegisterDataSource>()),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(login_repo: gh<_i96.LoginContract>()),
    );
    gh.factory<_i292.GetLevelsByPrimeMoverMuscleUseCases>(
      () => _i292.GetLevelsByPrimeMoverMuscleUseCases(gh<_i659.ExerciseRepo>()),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(gh<_i369.RegisterRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}
