import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/exercises_response.dart';
import 'package:fitness_app/features/home/home/data/models/random_exercise_response.dart';

abstract class HomeRepo {
  Future<ApiResult<String>> getCurrentUserName();

  Future<ApiResult<RandomExerciseResponse>> getRandomExercises();

  Future<ApiResult<FoodCategoriesResponse>> getMealsCategories();

  Future<ApiResult<ExercisesResponse>> getAllExercises();
}
