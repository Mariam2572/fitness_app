import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/features/home/home/data/models/user_response.dart';
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
}
