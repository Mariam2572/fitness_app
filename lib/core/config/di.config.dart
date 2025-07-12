// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/change%20password/data/data_source/change_password_data_source.dart'
    as _i283;
import '../../features/auth/change%20password/data/data_source/change_password_data_source_imp.dart'
    as _i20;
import '../../features/auth/change%20password/data/repo/change_password_repo_imp.dart'
    as _i756;
import '../../features/auth/change%20password/domain/repo/change_pssword_repo.dart'
    as _i760;
import '../../features/auth/change%20password/domain/usecase/change_passwrod_usecase.dart'
    as _i793;
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
import '../../features/exercise/domain/use_cases/get_exercise_by_mover_and_difficulty_level.dart'
    as _i646;
import '../../features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart'
    as _i292;
import '../../features/food/data/data%20sources/food_data_source.dart' as _i910;
import '../../features/food/data/data%20sources/food_data_source_imp.dart'
    as _i338;
import '../../features/food/data/repos/food_repo_imp.dart' as _i46;
import '../../features/food/domain/repos/food_repo.dart' as _i474;
import '../../features/food/domain/usecases/get_food_categories_usecase.dart'
    as _i589;
import '../../features/food/domain/usecases/get_meals_of_category_usecase.dart'
    as _i740;
import '../../features/foodDetails/data/data_source/meals_details_remote_data_source.dart'
    as _i710;
import '../../features/foodDetails/data/data_source/meals_details_remote_data_source_imp.dart'
    as _i986;
import '../../features/foodDetails/data/repository_implementation/meals_details_repository_implementation.dart'
    as _i274;
import '../../features/foodDetails/domain/repository_contract/meals_details_contract.dart'
    as _i225;
import '../../features/foodDetails/domain/usecases/meals_details_usecase.dart'
    as _i172;
import '../../features/foodDetails/presentation/view_model/meals_details_cubit.dart'
    as _i782;
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
import '../../features/logout/data/datasources/logout_remote_data_source_impl.dart'
    as _i115;
import '../../features/logout/data/datasources/logout_remote_datasource.dart'
    as _i671;
import '../../features/logout/data/repositories/logout_repository_impl.dart'
    as _i885;
import '../../features/logout/domain/repositories/logout_repository.dart'
    as _i1004;
import '../../features/logout/domain/usecases/logout_usecase.dart' as _i98;
import '../../features/profile/data/data_source/profile_remote_data_source.dart'
    as _i998;
import '../../features/profile/data/data_source/profile_remote_data_source_impl.dart'
    as _i531;
import '../../features/profile/data/repos/profile_repo_impl.dart' as _i1072;
import '../../features/profile/domain/repos/profile_repo.dart' as _i1007;
import '../../features/profile/domain/use_case/get_profile_data.dart' as _i663;
import '../../features/profile/domain/use_case/upload_photo__use_case.dart'
    as _i763;
import '../../features/profile/edit_profile/data/data_source/edit_profile_impl.dart'
    as _i688;
import '../../features/profile/edit_profile/data/repos/edit_profile_repo_impl.dart'
    as _i98;
import '../../features/profile/edit_profile/domain/data_source/edit_profile_data_source.dart'
    as _i843;
import '../../features/profile/edit_profile/domain/repos/edit_profile_repo.dart'
    as _i129;
import '../../features/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart'
    as _i514;
import '../../features/profile/edit_profile/domain/use_cases/get_logged_user_data_use_case.dart'
    as _i963;
import '../../features/profile/edit_profile/domain/use_cases/upload_photo_use_case.dart'
    as _i978;
import '../../features/smartCoach/data/data_source/remote_data_source/smart_coach_remote_data_source_impl.dart'
    as _i101;
import '../../features/smartCoach/data/data_sources/local/conversation_local_datasource.dart'
    as _i74;
import '../../features/smartCoach/data/data_sources/local/conversation_local_datasource_impl.dart'
    as _i683;
import '../../features/smartCoach/data/models/ConversationHiveModel.dart'
    as _i359;
import '../../features/smartCoach/data/repo/smart_coach_repo_impl.dart' as _i94;
import '../../features/smartCoach/data/repositories/conversation_repo_impl.dart'
    as _i234;
import '../../features/smartCoach/domain/repo/smart_coach_remote_data_source.dart'
    as _i511;
import '../../features/smartCoach/domain/repo/smart_coach_repo.dart' as _i708;
import '../../features/smartCoach/domain/repositories/ConversationRepository.dart'
    as _i374;
import '../../features/smartCoach/domain/use_case/send_message_use_case.dart'
    as _i469;
import '../../features/smartCoach/domain/use_cases/get_previous_conversations_usecase.dart'
    as _i998;
import '../../features/smartCoach/presentation/viewModel/PreviousConversationViewModel.dart'
    as _i72;
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
import '../utils/services/gemini_service.dart' as _i92;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final appModule = _$AppModule();
    gh.singleton<_i92.GeminiService>(() => _i92.GeminiService());
    gh.lazySingleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.lazySingleton<_i291.AppConfigProvider>(
        () => appModule.appConfigProvider);
    gh.factory<_i511.SmartCoachRemoteDataSource>(() =>
        _i101.SmartCoachRemoteDataSourceImpl(
            geminiService: gh<_i92.GeminiService>()));
    gh.singleton<_i361.Dio>(() => dioModule.provideDio(
          gh<_i361.LogInterceptor>(),
          gh<_i291.AppConfigProvider>(),
        ));
    gh.factory<_i74.ConversationLocalDataSource>(() =>
        _i683.ConversationLocalDataSourceImpl(
            gh<_i979.Box<_i359.ConversationHiveModel>>()));
    gh.factory<_i708.SmartCoachRepo>(() => _i94.SmartCoachRepoImpl(
        remoteDataSource: gh<_i511.SmartCoachRemoteDataSource>()));
    gh.singleton<_i785.ApiService>(
        () => dioModule.provideApiService(gh<_i361.Dio>()));
    gh.singleton<_i785.MealApiService>(
        () => dioModule.provideMealApiService(gh<_i361.Dio>()));
    gh.factory<_i374.ConversationRepository>(() =>
        _i234.ConversationRepositoryImpl(
            gh<_i74.ConversationLocalDataSource>()));
    gh.factory<_i710.MealsDetailsRemoteDataSource>(() =>
        _i986.MealsDetailsRemoteDataSourceImp(
            apiService: gh<_i785.MealApiService>()));
    gh.factory<_i159.HomeRemoteDataSource>(() => _i37.HomeRemoteDataSourceImpl(
          gh<_i785.ApiService>(),
          gh<_i785.MealApiService>(),
        ));
    gh.factory<_i671.LogoutRemoteDataSource>(() =>
        _i115.LogoutRemoteDataSourceImpl(apiService: gh<_i785.ApiService>()));
    gh.factory<_i469.SendMessageUseCase>(
        () => _i469.SendMessageUseCase(gh<_i708.SmartCoachRepo>()));
    gh.factory<_i520.LoginRemoteDataSource>(() =>
        _i1015.LoginRemoteDataSourceImp(apiService: gh<_i785.ApiService>()));
    gh.factory<_i998.ProfileRemoteDataSource>(
        () => _i531.ProfileRemoteDataSourceImpl(gh<_i785.ApiService>()));
    gh.factory<_i225.MealsDetailsContract>(() =>
        _i274.MealsDetailsRepositoryImplementation(
            mealsDetailsRemoteDataSource:
                gh<_i710.MealsDetailsRemoteDataSource>()));
    gh.factory<_i843.EditProfileDataSource>(
        () => _i688.EditProfileImpl(gh<_i785.ApiService>()));
    gh.factory<_i980.WorkOutsDataSource>(
        () => _i931.WorkOutsDataSourceImpl(gh<_i785.ApiService>()));
    gh.factory<_i998.GetPreviousConversationsUseCase>(() =>
        _i998.GetPreviousConversationsUseCase(
            gh<_i374.ConversationRepository>()));
    gh.factory<_i831.ExerciseRemoteDataSource>(
        () => _i424.ExerciseRemoteDataSourceImpl(gh<_i785.ApiService>()));
    gh.factory<_i72.PreviousConversationViewModel>(() =>
        _i72.PreviousConversationViewModel(
            gh<_i998.GetPreviousConversationsUseCase>()));
    gh.factory<_i910.FoodRemoteDataSource>(
        () => _i338.FoodRemoteDataSourceImpl(gh<_i785.MealApiService>()));
    gh.factory<_i751.HomeRepo>(
        () => _i362.HomeRepoImpl(gh<_i159.HomeRemoteDataSource>()));
    gh.factory<_i96.LoginContract>(() => _i268.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i520.LoginRemoteDataSource>()));
    gh.factory<_i659.ExerciseRepo>(
        () => _i824.ExerciseRepoImpl(gh<_i831.ExerciseRemoteDataSource>()));
    gh.factory<_i992.RegisterDataSource>(
        () => _i932.RegisterDataSourceImpl(gh<_i785.ApiService>()));
    gh.factory<_i1002.WorkOutsRepo>(
        () => _i638.WorkOutsRepoImpl(gh<_i980.WorkOutsDataSource>()));
    gh.factory<_i283.ChangePasswordRemoteDataSource>(
        () => _i20.ChangePasswordRemoteDataSourceImpl(gh<_i785.ApiService>()));
    gh.factory<_i1004.LogoutRepository>(() => _i885.LogoutRepositoryImpl(
        remoteDataSource: gh<_i671.LogoutRemoteDataSource>()));
    gh.factory<_i98.LogoutUseCase>(
        () => _i98.LogoutUseCase(gh<_i1004.LogoutRepository>()));
    gh.factory<_i129.EditProfileRepo>(
        () => _i98.EditProfileRepoImpl(gh<_i843.EditProfileDataSource>()));
    gh.factory<_i1023.GetAllMusclesByMuscleGroupIdUseCase>(() =>
        _i1023.GetAllMusclesByMuscleGroupIdUseCase(gh<_i1002.WorkOutsRepo>()));
    gh.factory<_i80.GetAllMusclesGroupsUseCase>(
        () => _i80.GetAllMusclesGroupsUseCase(gh<_i1002.WorkOutsRepo>()));
    gh.factory<_i760.ChangePasswordRepo>(() => _i756.ChangePasswordRepoImpl(
        gh<_i283.ChangePasswordRemoteDataSource>()));
    gh.factory<_i474.FoodRepo>(
        () => _i46.FoodRepoImpl(gh<_i910.FoodRemoteDataSource>()));
    gh.factory<_i514.EditProfileUseCase>(
        () => _i514.EditProfileUseCase(gh<_i129.EditProfileRepo>()));
    gh.factory<_i963.GetLoggedUserDataUseCase>(
        () => _i963.GetLoggedUserDataUseCase(gh<_i129.EditProfileRepo>()));
    gh.factory<_i978.UploadPhotoUseCase>(
        () => _i978.UploadPhotoUseCase(gh<_i129.EditProfileRepo>()));
    gh.factory<_i172.MealsDetailsUsecase>(() => _i172.MealsDetailsUsecase(
        mealsDetailsContract: gh<_i225.MealsDetailsContract>()));
    gh.factory<_i1007.ProfileRepository>(() =>
        _i1072.ProfileRepositoryImpl(gh<_i998.ProfileRemoteDataSource>()));
    gh.factory<_i369.RegisterRepo>(
        () => _i566.RegisterRepoImpl(gh<_i992.RegisterDataSource>()));
    gh.factory<_i401.LoginUsecase>(
        () => _i401.LoginUsecase(login_repo: gh<_i96.LoginContract>()));
    gh.factory<_i204.HomeUseCase>(() => _i204.HomeUseCase(
          gh<_i751.HomeRepo>(),
          gh<_i80.GetAllMusclesGroupsUseCase>(),
          gh<_i1023.GetAllMusclesByMuscleGroupIdUseCase>(),
        ));
    gh.factory<_i793.ChangePasswordUseCase>(
        () => _i793.ChangePasswordUseCase(gh<_i760.ChangePasswordRepo>()));
    gh.factory<_i782.MealsDetailsCubit>(
        () => _i782.MealsDetailsCubit(gh<_i172.MealsDetailsUsecase>()));
    gh.factory<_i646.GetExerciseByMoverAndDifficultyLevelUseCase>(() =>
        _i646.GetExerciseByMoverAndDifficultyLevelUseCase(
            gh<_i659.ExerciseRepo>()));
    gh.factory<_i292.GetLevelsByPrimeMoverMuscleUseCases>(() =>
        _i292.GetLevelsByPrimeMoverMuscleUseCases(gh<_i659.ExerciseRepo>()));
    gh.factory<_i589.GetFoodCategoriesUseCase>(
        () => _i589.GetFoodCategoriesUseCase(gh<_i474.FoodRepo>()));
    gh.factory<_i740.GetMealsByCategoryUseCase>(
        () => _i740.GetMealsByCategoryUseCase(gh<_i474.FoodRepo>()));
    gh.factory<_i663.GetProfileData>(
        () => _i663.GetProfileData(gh<_i1007.ProfileRepository>()));
    gh.factory<_i763.UploadPhoto>(
        () => _i763.UploadPhoto(gh<_i1007.ProfileRepository>()));
    gh.factory<_i118.RegisterUseCase>(
        () => _i118.RegisterUseCase(gh<_i369.RegisterRepo>()));
    gh.factory<_i1043.HomeViewModel>(
        () => _i1043.HomeViewModel(gh<_i204.HomeUseCase>()));
    return this;
  }
}

class _$DioModule extends _i591.DioModule {}

class _$AppModule extends _i913.AppModule {}
