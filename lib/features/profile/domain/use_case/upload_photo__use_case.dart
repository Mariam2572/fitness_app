import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  final ProfileRepo profileRepository;
  UploadPhotoUseCase(this.profileRepository);

  Future<ApiResult<String>> call(File photo) async {
    return await profileRepository.uploadPhoto(photo);
  }
}
