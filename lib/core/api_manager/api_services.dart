import 'package:dio/dio.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(Constants.registerEndPoint)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);
}
