import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/features/auth/login/domain/repository_icontract/login_contract.dart';

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
