import 'dart:io';
import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserResponse> getProfile() async {
    final response = await apiService.getProfileData();

    return response;
  }

  @override
  Future<String> uploadPhoto(File photo) async {
    return await apiService.uploadPhoto(photo);
  }
}
