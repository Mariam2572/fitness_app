import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';

abstract interface class WorkOutsRepo {
  Future<ApiResult<GetAllMusclesGroupsReponse>> getAllMusclesGroups();
  Future<ApiResult<GetAllMusclesByMuscleGroupIdReponse>> getAllMusclesByMuscleGroupId(String id);
}
