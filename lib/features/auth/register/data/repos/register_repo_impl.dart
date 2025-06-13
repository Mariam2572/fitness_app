import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/repos/register_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<ApiResult<RegisterResponse>> register(
    RegisterRequest registerRequest,
  ) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
