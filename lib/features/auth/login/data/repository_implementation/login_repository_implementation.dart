import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/feature/login/data/data_source/login_remote_data_source.dart';
import 'package:fitness_app/feature/login/data/model/login_request.dart';
import 'package:fitness_app/feature/login/data/model/login_response.dart';
import 'package:fitness_app/feature/login/domain/repository_icontract/login_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginContract)
class LoginRepositoryImplementation implements LoginContract {
  final LoginRemoteDataSource _loginRemoteDataSource;
  LoginRepositoryImplementation({
    required LoginRemoteDataSource loginRemoteDataSource,
  }) : _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    return await _loginRemoteDataSource.login(loginRequest: loginRequest);
  }
}
