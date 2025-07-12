
import 'package:fitness_app/core/base/api_result.dart';

abstract interface class LogoutRemoteDataSource {
  Future<ApiResult<String>>logout();
}
