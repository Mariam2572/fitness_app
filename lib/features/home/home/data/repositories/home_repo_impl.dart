import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/data_sources/home_remote_data_source.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{

  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<ApiResult<String>> getCurrentUserName()async{

    return await homeRemoteDataSource.getCurrentUserName();

  }

  @override
  Future<ApiResult<RandomExerciseResponse>> getRandomExercises() async{
      return await homeRemoteDataSource.getRandomExercises();
  }

}