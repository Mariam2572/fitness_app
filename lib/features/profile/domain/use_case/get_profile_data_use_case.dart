import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/data/models/UserResponse.dart';
import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDataUseCase {
  final ProfileRepository repository;
  GetProfileDataUseCase(this.repository);

  Future<ApiResult<UserResponse>> call() async => await repository.getProfile();
}
