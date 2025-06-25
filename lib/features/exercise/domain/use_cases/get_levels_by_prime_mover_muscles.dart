// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:injectable/injectable.dart';

import 'package:fitness_app/features/exercise/domain/repos/exercise_repo.dart';

@injectable
class GetLevelsByPrimeMoverMuscleUseCases {
  ExerciseRepo _exerciseRepo;
  GetLevelsByPrimeMoverMuscleUseCases(
     this._exerciseRepo,
  );

  Future<ApiResult<LevelsByMusclesModel>> call({required String primeMoverMuscleId}) async {
    return await _exerciseRepo.getLevelsByMuscles(primeMoverMuscleId: primeMoverMuscleId);
  }
}
