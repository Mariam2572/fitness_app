import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_response.dart';
import 'package:injectable/injectable.dart';

import 'package:fitness_app/features/auth/change%20password/data/data_source/change_password_data_source.dart';

@Injectable(as: ChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSource {
  final ApiService _apiService;

  ChangePasswordRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    final userToken = await secureStorage.read(key: Constants.userToken);
    if (userToken == null) {
      return const ApiError(message: "Token is missing");
    }

    return await apiExecuter<ChangePasswordResponse>(
      () => _apiService.changePassword(request, "Bearer $userToken"),
      "  ",
    );
  }
}
