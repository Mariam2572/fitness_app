import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhoto {
  final ProfileRepository repository;
  UploadPhoto(this.repository);

  Future<ApiResult<String>> call(File file) async =>
      await repository.uploadPhoto(file);
}
