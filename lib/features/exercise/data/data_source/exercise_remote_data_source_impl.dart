// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:injectable/injectable.dart';

import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/data_source/exercise_remote_data_source.dart';

@Injectable(as: ExerciseRemoteDataSource)
class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  ApiService _apiService;
  ExerciseRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<LevelsByMusclesModel>> getLevelsByMuscles({
    required String primeMoverMuscleId,
  }) async {
    return await apiExecuter<LevelsByMusclesModel>(
      () async => await _apiService.getLevelsByMuscles(primeMoverMuscleId),
      'ExerciseRemoteDataSourceImpl',
    );
  }
}
