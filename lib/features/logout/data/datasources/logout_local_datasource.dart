import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LogoutLocalDataSource {
  Future<void> clearUserData();
}

@Injectable(as: LogoutLocalDataSource)
class LogoutLocalDataSourceImpl implements LogoutLocalDataSource {
  @override
  Future<void> clearUserData() async {
    await secureStorage.delete(key: Constants.userToken);
  }
}
