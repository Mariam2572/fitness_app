import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fitness_app/features/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{

  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<ApiResult<String>> getCurrentUserName()async{

    return await homeRemoteDataSource.getCurrentUserName();

  }

  @override
  Future<ApiResult<RandomExerciseResponse>> getRandomExercises() async{
      return await homeRemoteDataSource.getRandomExercises();
  }

  @override
  Future<ApiResult<FoodCategoriesResponse>> getMealsCategories() async{

    return await homeRemoteDataSource.getMealsCategories();


  }
  @override
  Future<ApiResult<ExercisesResponse>> getAllExercises() async{

    return await homeRemoteDataSource.getAllMuscles();


  }

}