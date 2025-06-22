import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/data_source/exercise_remote_data_source.dart';
import 'package:fitness_app/features/exercise/domain/repos/exercise_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo{
  ExerciseRemoteDataSource _exerciseRemoteDataSource;
  ExerciseRepoImpl(this._exerciseRemoteDataSource);
  @override
  Future<ApiResult<LevelsByMusclesModel>> getLevelsByMuscles({required String primeMoverMuscleId}) async {
  return  await _exerciseRemoteDataSource.getLevelsByMuscles(primeMoverMuscleId: primeMoverMuscleId);
    
  }

}