
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase{

  final HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<ApiResult<String>> getUserName()async{
    return await homeRepo.getCurrentUserName();
  }
  Future<ApiResult<RandomExerciseResponse>> getRandomExercise()async{
    return await homeRepo.getRandomExercises();
  }
  Future<ApiResult<FoodCategoriesResponse>> getMealsCategories()async{
    return await homeRepo.getMealsCategories();
  }
  
  Future<ApiResult<ExercisesResponse>> getAllExercises()async{
    return await homeRepo.getAllExercises();
  }



}