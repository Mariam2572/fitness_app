import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';

abstract interface class ForgetPasswordDataSource {
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest);
  Future<ApiResult<VerifyResetResponse>> verifyReset(VerifyResetRequest verifyResetRequest);
  Future<ApiResult<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);
}
