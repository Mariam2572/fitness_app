import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/feature/login/data/model/login_request.dart';
import 'package:fitness_app/feature/login/data/model/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest});
}
