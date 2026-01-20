import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/logout/data/datasources/logout_remote_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRemoteDataSource)
class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  ApiService apiService;
  LogoutRemoteDataSourceImpl({required this.apiService});
  @override
  Future<ApiResult<String>> logout() async {
    return await apiExecuter(
      () async => await apiService.logout(),
      'LogoutRemoteDataSourceImpl',
    );
  }
}
