import 'package:dio/dio.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';

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
  @POST(Constants.forgotPassword)
  Future<ForgetPasswordResponse> forgotPassword(@Body()ForgetPasswordRequest forgetPasswordRequest);

  @POST(Constants.verifyResetCode)
  Future<VerifyResetResponse> verifyResetCode(@Body()VerifyResetRequest verifyResetRequest);

  @PUT(Constants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(@Body()ResetPasswordRequest resetPassword);
}

@RestApi(baseUrl: Constants.mealBaseUrl)
abstract class MealApiService {
  factory MealApiService(Dio dio) = _MealApiService;

  @GET(Constants.getMealsDetailsEndPoint)
    Future<dynamic> getMealsDetails(@Path("i") String i);

}

