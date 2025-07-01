import 'dart:io';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitness_app/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) {
    // TODO: implement uploadPhoto
    throw UnimplementedError();
  }
}

//   @override
//   Future<ApiResult<String>> uploadPhoto(File photo) async {
//     try {
//       if (await photo.exists()) {
//         log(" file exists. path: ${photo.path}");
//       } else {
//         log("file doesn't exist.");
//       }
//       final data = await remoteDataSource.uploadPhoto(photo);
//       return Right(data);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       } else {
//         log('error  $e');
//         return left(ServerFailure(errorMessage: e.toString()));
//       }
//     }
//   }
// }
