// data/repos/change_password_repo_impl.dart

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/change%20password/data/data_source/change_password_data_source.dart';

import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:fitness_app/features/auth/change%20password/domain/repo/change_pssword_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepoImpl(this.remoteDataSource);

  @override
  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    return await remoteDataSource.changePassword(request: request);
  }
}
