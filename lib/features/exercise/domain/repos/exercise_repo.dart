import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';

abstract interface class ExerciseRepo {
  Future<ApiResult<LevelsByMusclesModel>> getLevelsByMuscles({required String primeMoverMuscleId});
}