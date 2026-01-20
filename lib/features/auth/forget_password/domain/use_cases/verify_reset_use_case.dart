import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetUseCase {
  ForgetPasswordRepo repo;
  VerifyResetUseCase(this.repo);
  Future<ApiResult<VerifyResetResponse>> invoke(
    VerifyResetRequest verifyResetRequest,
  ) async {
    return await repo.verifyReset(verifyResetRequest);
  }
}
