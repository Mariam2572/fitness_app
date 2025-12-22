import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';

import 'package:fitness_app/features/workOuts/domain/repos/work_outs_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllMusclesByMuscleGroupIdUseCase {
  final WorkOutsRepo _workOutsRepo;
  GetAllMusclesByMuscleGroupIdUseCase(this._workOutsRepo);
  Future<ApiResult<GetAllMusclesByMuscleGroupIdReponse>> invoke(
    String id,
  ) async {
    return await _workOutsRepo.getAllMusclesByMuscleGroupId(id);
  }
}
