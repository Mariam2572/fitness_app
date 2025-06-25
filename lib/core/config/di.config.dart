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
import '../../features/workOuts/data/data_source/work_outs_data_source_impl.dart'
    as _i931;
import '../../features/workOuts/data/repos/work_outs_repo_impl.dart' as _i638;
import '../../features/workOuts/domain/data_source/work_outs_data_source.dart'
    as _i980;
import '../../features/workOuts/domain/repos/work_outs_repo.dart' as _i1002;
import '../../features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart'
    as _i1023;
import '../../features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart'
    as _i80;
import '../api_manager/api_services.dart' as _i785;
import '../api_manager/dio_module.dart' as _i591;
import '../provider/app_config_provider.dart' as _i291;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final appModule = _$AppModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.lazySingleton<_i291.AppConfigProvider>(
      () => appModule.appConfigProvider,
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i291.AppConfigProvider>(),
      ),
    );
    gh.singleton<_i785.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i520.LoginRemoteDataSource>(
      () => _i1015.LoginRemoteDataSourceImp(apiService: gh<_i785.ApiService>()),
    );
    gh.factory<_i980.WorkOutsDataSource>(
      () => _i931.WorkOutsDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i96.LoginContract>(
      () => _i268.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i520.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i992.RegisterDataSource>(
      () => _i932.RegisterDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i1002.WorkOutsRepo>(
      () => _i638.WorkOutsRepoImpl(gh<_i980.WorkOutsDataSource>()),
    );
    gh.factory<_i1023.GetAllMusclesByMuscleGroupIdUseCase>(
      () =>
          _i1023.GetAllMusclesByMuscleGroupIdUseCase(gh<_i1002.WorkOutsRepo>()),
    );
    gh.factory<_i80.GetAllMusclesGroupsUseCase>(
      () => _i80.GetAllMusclesGroupsUseCase(gh<_i1002.WorkOutsRepo>()),
    );
    gh.factory<_i369.RegisterRepo>(
      () => _i566.RegisterRepoImpl(gh<_i992.RegisterDataSource>()),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(login_repo: gh<_i96.LoginContract>()),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(gh<_i369.RegisterRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}

class _$AppModule extends _i913.AppModule {}
