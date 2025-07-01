// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ApiService apiService;
  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) async {
    // TODO: implement uploadPhoto
    throw UnimplementedError();
  }
}
