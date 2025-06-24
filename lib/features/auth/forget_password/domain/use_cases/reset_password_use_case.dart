import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepo repo;
  ResetPasswordUseCase(this.repo);
  Future<ApiResult<ResetPasswordResponse>> invoke(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await repo.resetPassword(resetPasswordRequest);
  }
}
