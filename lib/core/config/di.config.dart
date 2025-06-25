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
import '../../features/food/data/data%20sources/food_data_source.dart' as _i910;
import '../../features/food/data/data%20sources/food_data_source_imp.dart'
    as _i338;
import '../../features/food/data/repos/food_repo_imp.dart' as _i46;
import '../../features/food/domain/repos/food_repo.dart' as _i474;
import '../../features/food/domain/usecases/get_food_categories_usecase.dart'
    as _i589;
import '../../features/food/domain/usecases/get_meals_of_category_usecase.dart'
    as _i740;
import '../../features/home/home/data/data_sources/home_remote_data_source.dart'
    as _i159;
import '../../features/home/home/data/data_sources/home_remote_data_source_impl.dart'
    as _i37;
import '../../features/home/home/data/repositories/home_repo_impl.dart'
    as _i362;
import '../../features/home/home/domain/repositories/home_repo.dart' as _i751;
import '../../features/home/home/domain/use_cases/home_use_case.dart' as _i204;
import '../../features/home/home/presentation/view_model/home_viewModel.dart'
    as _i1043;
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
    gh.lazySingleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i785.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.singleton<_i785.MealApiService>(
      () => dioModule.provideMealApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i520.LoginRemoteDataSource>(
      () => _i1015.LoginRemoteDataSourceImp(apiService: gh<_i785.ApiService>()),
    );
    gh.factory<_i910.FoodRemoteDataSource>(
      () => _i338.FoodRemoteDataSourceImpl(gh<_i785.MealApiService>()),
    );
    gh.factory<_i159.HomeRemoteDataSource>(
      () => _i37.HomeRemoteDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i751.HomeRepo>(
      () => _i362.HomeRepoImpl(gh<_i159.HomeRemoteDataSource>()),
    );
    gh.factory<_i96.LoginContract>(
      () => _i268.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i520.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i992.RegisterDataSource>(
      () => _i932.RegisterDataSourceImpl(gh<_i785.ApiService>()),
    );
    gh.factory<_i474.FoodRepo>(
      () => _i46.FoodRepoImpl(gh<_i910.FoodRemoteDataSource>()),
    );
    gh.factory<_i369.RegisterRepo>(
      () => _i566.RegisterRepoImpl(gh<_i992.RegisterDataSource>()),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(login_repo: gh<_i96.LoginContract>()),
    );
    gh.factory<_i589.GetFoodCategoriesUseCase>(
      () => _i589.GetFoodCategoriesUseCase(gh<_i474.FoodRepo>()),
    );
    gh.factory<_i740.GetMealsByCategoryUseCase>(
      () => _i740.GetMealsByCategoryUseCase(gh<_i474.FoodRepo>()),
    );
    gh.factory<_i204.HomeUseCase>(
      () => _i204.HomeUseCase(gh<_i751.HomeRepo>()),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(gh<_i369.RegisterRepo>()),
    );
    gh.factory<_i1043.HomeViewModel>(
      () => _i1043.HomeViewModel(gh<_i204.HomeUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}
