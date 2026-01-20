import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/repos/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo _editProfileRepo;
  EditProfileUseCase(this._editProfileRepo);
  Future<ApiResult<GetUserDataReponse>> invoke(
    EditProfileRequest editProfileRequest,
  ) async {
    return await _editProfileRepo.editProfile(editProfileRequest);
  }
}
