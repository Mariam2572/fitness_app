import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/domain/repo/change_pssword_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo repo;

  ChangePasswordUseCase(this.repo);

  Future<ApiResult<ChangePasswordResponse>> invoke(
    ChangePasswordRequest request,
  ) async {
    return await repo.changePassword(request: request);
  }
}
