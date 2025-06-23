import 'package:dio/dio.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: Constants.foodBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(Constants.loginEndPoint)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginRequest);
  @POST(Constants.registerEndPoint)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);
  @GET(Constants.foodCategoriesEndPoint)
  Future<FoodCategoriesResponse> getFoodCategories();
  @GET(Constants.mealsOfCategoryEndPoint)
  Future<MealsOfCategoryResponse> getMealsByCategory(
    @Query('c') String category,
  );
}
