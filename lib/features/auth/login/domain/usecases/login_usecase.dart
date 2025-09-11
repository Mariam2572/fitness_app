import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';

import 'package:fitness_app/features/auth/login/domain/repos/login_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepo loginRepo;

  LoginUsecase({required this.loginRepo});

  Future<ApiResult<LoginResponse>> invoke({
    required LoginRequest loginRequest,
  }) async {
    return await loginRepo.login(loginRequest: loginRequest);
  }
}
