import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/domain/repos/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExerciseByMoverAndDifficultyLevelUseCase {
  final ExerciseRepo _exerciseRepo;
  GetExerciseByMoverAndDifficultyLevelUseCase(this._exerciseRepo);
  Future<ApiResult<ExerciseByPrimeMoverAndDifficultyResponse>> call({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) async {
    return await _exerciseRepo.getExerciseByMoverAndDifficultyLevel(
      primeMoverMuscleId: primeMoverMuscleId,
      difficultyLevelId: difficultyLevelId,
    );
  }
}
