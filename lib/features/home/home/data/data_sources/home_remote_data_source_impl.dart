
import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/data_sources/home_remote_data_source.dart';
import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{

  final ApiService apiService;
  final MealApiService mealsApiService;

  HomeRemoteDataSourceImpl(this.apiService,this.mealsApiService);

  @override
  Future<ApiResult<String>> getCurrentUserName()async{
    try {

      var userToken = await secureStorage.read(key: Constants.userToken);

      if (userToken == null) {
        return const ApiError(message: "Token is missing");
      }

      final response = await apiService.getUserData("Bearer $userToken");

      final firstName = response.user?.firstName??"Guest";

      return ApiSuccess(data: firstName);

    }catch(e){

      return ApiError(message: "Failed to load user name: $e");

    }
  }

  @override
  Future<ApiResult<RandomExerciseResponse>> getRandomExercises() async{

    try {
     var result = await apiService.getRandomExercises(
          Constants.randomExerciseTargetMuscleGroupId,
          Constants.randomExerciseDifficultyLevelId,
          5
     );

     if (result == null) {
       return const ApiError(message: "No data returned from API.");
     }

     if (result.exercises == null || result.exercises!.isEmpty) {
       return const ApiError(message: "No exercises found.");
     }
     return ApiSuccess(data: result);

    }catch (e) {
      return ApiError(message: "Something went wrong: $e");
    }
  }

  @override
  Future<ApiResult<FoodCategoriesResponse>> getMealsCategories() {
    return apiExecuter(() => mealsApiService.getFoodCategories(),"getMealsCategories");
  }
  @override
  Future<ApiResult<ExercisesResponse>> getAllMuscles() {
    return apiExecuter(() => apiService.getAllExercises(),"getMealsCategories");
  }




}