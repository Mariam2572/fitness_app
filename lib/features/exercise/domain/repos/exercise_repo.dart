import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';

abstract interface class ExerciseRepo {
  Future<ApiResult<LevelsByMusclesModel>> getLevelsByMuscles({
    required String primeMoverMuscleId,
  });
  Future<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>>
  getExerciseByMoverAndDifficultyLevel({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  });
}
