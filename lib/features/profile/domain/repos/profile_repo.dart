
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';
import 'dart:io';

abstract class ProfileRepository {
  Future<ApiResult<UserResponse>> getProfile();
  // Future<ApiResult<String>> uploadPhoto(File file);
}

