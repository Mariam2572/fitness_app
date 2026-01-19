import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/logout/data/datasources/logout_local_datasource.dart';
import 'package:fitness_app/features/logout/data/datasources/logout_remote_datasource.dart';
import 'package:fitness_app/features/logout/domain/repositories/logout_repository.dart'
    show LogoutRepository;
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepository)
class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;
  final LogoutLocalDataSource localDataSource;

  LogoutRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<ApiResult<String>> logout() async {
    final result = await remoteDataSource.logout();
    if (result is ApiSuccess) {
      await localDataSource.clearUserData();
    }
    return result;
  }
}
