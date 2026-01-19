import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/request/verify_reset_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/response/verify_reset_response.dart';
import 'package:fitness_app/features/auth/forget_password/domain/data_source/forget_password_data_source.dart';
import 'package:injectable/injectable.dart';

import 'package:fitness_app/core/base/api_excuter.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ApiService apiService;
  ForgetPasswordDataSourceImpl(this.apiService);
  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    return await apiExecuter<ForgetPasswordResponse>(() async {
      final response = await apiService.forgotPassword(forgetPasswordRequest);
      return response;
    }, 'ForgetPasswordDataSourceImpl forgetPassword');
  }

  @override
  Future<ApiResult<VerifyResetResponse>> verifyReset(
    VerifyResetRequest verifyResetRequest,
  ) async {
    return await apiExecuter<VerifyResetResponse>(() async {
      final response = await apiService.verifyResetCode(verifyResetRequest);
      return response;
    }, 'ForgetPasswordDataSourceImpl verifyReset');
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await apiExecuter<ResetPasswordResponse>(() async {
      final response = await apiService.resetPassword(resetPasswordRequest);
      return response;
    }, 'ForgetPasswordDataSourceImpl resetPassword');
  }
}
