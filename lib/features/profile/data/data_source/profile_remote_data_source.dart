import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';

abstract class ProfileRemoteDataSource {
  Future<ApiResult<String>> uploadPhoto(File photo);
}
