import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';

abstract interface class RegisterDataSource {
  Future<ApiResult<RegisterResponse>> register(RegisterRequest registerRequest);
}
