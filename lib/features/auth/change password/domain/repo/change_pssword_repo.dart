import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';

abstract class ChangePasswordRepo {
  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest request,
  });
}
