import 'dart:io';

import 'package:fitness_app/features/home/data/models/UserResponse.dart';

abstract class ProfileRemoteDataSource {
  // Future<String> uploadPhoto(File photo);
  Future<UserResponse> getProfile();
}
