
import 'package:fitness_app/core/base/api_result.dart';

abstract interface class LogoutRepository {
  Future<ApiResult<String>> logout();
}
