import 'package:fitness_app/features/home/home/data/models/user_response.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserResponse> getProfile();
}
