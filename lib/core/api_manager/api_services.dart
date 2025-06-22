import 'package:dio/dio.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_model.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(Constants.loginEndPoint)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginRequest);
  @POST(Constants.registerEndPoint)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);
  @GET(Constants.getExerciseByMoverAndDifficultyEndPoint)
  Future<ExerciseByPrimeMoverAndDifficultyResponse> getExerciseByMoverAndDifficulty(@Query("primeMoverMuscleId") String primeMoverMuscleId, @Query("difficultyLevelId") String difficultyLevelId);

  @GET(Constants.levelsByMuscleEndPoint)
  Future<LevelsByMusclesModel> getLevelsByMuscles(@Query("primeMoverMuscleId") String primeMoverMuscleId);
}
