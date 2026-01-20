import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo repo;
  ForgetPasswordUseCase(this.repo);
  Future<ApiResult<ForgetPasswordResponse>> invoke(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    return await repo.forgetPassword(forgetPasswordRequest);
  }
}
