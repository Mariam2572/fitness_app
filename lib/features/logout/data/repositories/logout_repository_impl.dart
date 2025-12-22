import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/logout/data/datasources/logout_remote_datasource.dart';
import 'package:fitness_app/features/logout/domain/repositories/logout_repository.dart'
    show LogoutRepository;
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepository)
class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<String>> logout() async {
    return await remoteDataSource.logout();
  }
}
