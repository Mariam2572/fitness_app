
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';

abstract class HomeRepo{

  Future<ApiResult<String>> getCurrentUserName();

  Future<ApiResult<RandomExerciseResponse>> getRandomExercises();






}