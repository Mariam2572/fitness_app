import 'dart:io';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/upload_photo_response.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';

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
  Future<ExerciseByPrimeMoverAndDifficultyResponse>
  getExerciseByMoverAndDifficulty(
    @Query("primeMoverMuscleId") String primeMoverMuscleId,
    @Query("difficultyLevelId") String difficultyLevelId,
  );

  @GET(Constants.levelsByMuscleEndPoint)
  Future<LevelsByMusclesModel> getLevelsByMuscles(
    @Query("primeMoverMuscleId") String primeMoverMuscleId,
  );
  Future<LevelsByMusclesModel> getLevelsByMuscles(
    @Query("primeMoverMuscleId") String primeMoverMuscleId,
  );

  @GET(Constants.getAllMusclesGroupsEndPoint)
  Future<GetAllMusclesGroupsReponse> getAllMusclesGroups();

  @GET("${Constants.getAllMusclesByMuscleGroupIdEndPoint}/{id}")
  Future<GetAllMusclesByMuscleGroupIdReponse> getAllMusclesByMuscleGroupId(
    @Path("id") String id,
  );
  @GET(Constants.getAllExercisesEndPoint)
  Future<ExercisesResponse> getAllExercises();

  @GET(Constants.getCurrentUserDataEndPoint)
  Future<UserResponse> getUserData(@Header("Authorization") String userToken);

  @GET(Constants.randomExercisesEndPoint)
  Future<RandomExerciseResponse> getRandomExercises(
    @Query("targetMuscleGroupId") String targetMuscleGroupId,
    @Query("difficultyLevelId") String difficultyLevelId,
    @Query("limit") int limit,
  );

  @MultiPart()
  @PUT(Constants.upLoadProfilePhoto)
  Future<String> uploadPhoto(@Part(name: "photo") File image);

  @GET(Constants.getCurrentUserDataEndPoint)
  Future<UserResponse> getProfileData(
  );
  @PATCH(Constants.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequest ChangePasswordRequest,
    @Header("Authorization") String userToken,
  );
    @GET(Constants.logoutEndPoint)
  Future<String> logout();
}
  

@RestApi(baseUrl: Constants.mealBaseUrl)
abstract class MealApiService {
  factory MealApiService(Dio dio) = _MealApiService;

  @GET(Constants.getMealsDetailsEndPoint)
  Future<MealsDatailsResponse> getMealsDetails(@Path("i") String i);
  @GET(Constants.foodCategoriesEndPoint)
  Future<FoodCategoriesResponse> getFoodCategories();

  @GET(Constants.mealsOfCategoryEndPoint)
  Future<MealsOfCategoryResponse> getMealsByCategory(
    @Query('c') String category,
  );
  
}
