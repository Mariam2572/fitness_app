import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/data_source/edit_profile_data_source.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/repos/edit_profile_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDataSource _editProfileDataSource;
  EditProfileRepoImpl(this._editProfileDataSource);

  @override
  Future<ApiResult<GetUserDataReponse>> editProfile(EditProfileRequest editProfileRequest)async {
    return await _editProfileDataSource.editProfile(editProfileRequest);
  }

  @override
  Future<ApiResult<GetUserDataReponse>> getLoggedUserData()async {
    return await _editProfileDataSource.getLoggedUserData();
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) async {
    return await _editProfileDataSource.uploadPhoto(photo);
  }


}
