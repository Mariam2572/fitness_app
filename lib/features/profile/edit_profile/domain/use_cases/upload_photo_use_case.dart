import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/repos/edit_profile_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  final EditProfileRepo _editProfileRepo;
  UploadPhotoUseCase(this._editProfileRepo);
  Future<ApiResult<String>> invoke(File photo) async {
    return await _editProfileRepo.uploadPhoto(photo);
  }
}
