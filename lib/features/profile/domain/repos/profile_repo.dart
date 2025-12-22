import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/user_response.dart';

abstract class ProfileRepository {
  Future<ApiResult<UserResponse>> getProfile();
}
