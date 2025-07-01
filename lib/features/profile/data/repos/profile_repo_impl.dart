import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<UserResponse>> getProfile() async {
    try {
      final result = await remoteDataSource.getProfile();
      return ApiSuccess(data: result);
    } catch (e) {
      return ApiError(message: e.toString());
    }
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File file) async {
    try {
      final result = await remoteDataSource.uploadPhoto(file);
      return ApiSuccess(data: result);
    } catch (e) {
      return ApiError(message: e.toString());
    }
  }
}
