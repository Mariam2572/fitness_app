import 'dart:io';

import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/api_manager/upload_image_api_manager.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/upload_photo_response.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/data_source/edit_profile_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileImpl implements EditProfileDataSource {
  final ApiService _apiService;
final UploadImageApiManager _imageApiManager;
  EditProfileImpl(this._apiService,this._imageApiManager);
  @override
  Future<ApiResult<GetUserDataReponse>> editProfile(EditProfileRequest editProfileRequest) async {
    return await apiExecuter<GetUserDataReponse>(
          () async => await _apiService.editProfile(editProfileRequest),
      '',
    );
  }
  @override
  Future<ApiResult<GetUserDataReponse>> getLoggedUserData()  async {
    return await apiExecuter<GetUserDataReponse>(
          () async => await _apiService.getLoggedProfileData(),
      '',
    );
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File photo)  async {

    return await apiExecuter<String>(

          () async => await _imageApiManager.uploadImage(photo),
      '',
    );
  }
}
