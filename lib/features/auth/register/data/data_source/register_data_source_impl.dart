import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/data/models/response/register_response.dart';
import 'package:fitness_app/features/auth/register/domain/repos/data_source/register_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterDataSource)
class RegisterDataSourceImpl implements RegisterDataSource {
  final ApiService _apiService;
  RegisterDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<RegisterResponse>> register(
    RegisterRequest registerRequest,
  ) async {
    return await apiExecuter<RegisterResponse>(
      () async => await _apiService.register(registerRequest),
      'error in RegisterDataSourceImpl ',
    );
  }
}
