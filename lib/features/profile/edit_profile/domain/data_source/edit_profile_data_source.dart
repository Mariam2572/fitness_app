import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';

abstract interface class EditProfileDataSource {
  Future<ApiResult<GetUserDataReponse>> getLoggedUserData();
  Future<ApiResult<GetUserDataReponse>> editProfile(
    EditProfileRequest editProfileRequest,
  );
  Future<ApiResult<String>> uploadPhoto(File photo);
}
