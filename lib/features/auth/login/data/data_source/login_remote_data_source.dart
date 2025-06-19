import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';


abstract class LoginRemoteDataSource {
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest});
}
