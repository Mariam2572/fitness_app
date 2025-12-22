import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/repos/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserDataUseCase {
  final EditProfileRepo _editProfileRepo;
  GetLoggedUserDataUseCase(this._editProfileRepo);
  Future<ApiResult<GetUserDataReponse>> invoke() async {
    return await _editProfileRepo.getLoggedUserData();
  }
}
