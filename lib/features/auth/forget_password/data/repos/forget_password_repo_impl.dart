import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/data_source/forget_password_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  ForgetPasswordDataSource forgetPasswordDataSource;
  ForgetPasswordRepoImpl({required this.forgetPasswordDataSource});

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    return await forgetPasswordDataSource.forgetPassword(forgetPasswordRequest);
  }

  @override
  Future<ApiResult<VerifyResetResponse>> verifyReset(
    VerifyResetRequest verifyResetRequest,
  ) async {
    return await forgetPasswordDataSource.verifyReset(verifyResetRequest);
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await forgetPasswordDataSource.resetPassword(resetPasswordRequest);
  }
}
