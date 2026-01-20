import 'package:fitness_app/core/base/api_result.dart';

import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/workOuts/domain/data_source/work_outs_data_source.dart';
import 'package:fitness_app/features/workOuts/domain/repos/work_outs_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkOutsRepo)
class WorkOutsRepoImpl implements WorkOutsRepo {
  final WorkOutsDataSource _workOutsDataSource;
  WorkOutsRepoImpl(this._workOutsDataSource);

  @override
  Future<ApiResult<GetAllMusclesByMuscleGroupIdReponse>>
  getAllMusclesByMuscleGroupId(String id) async {
    return await _workOutsDataSource.getAllMusclesByMuscleGroupId(id);
  }

  @override
  Future<ApiResult<GetAllMusclesGroupsReponse>> getAllMusclesGroups() async {
    return await _workOutsDataSource.getAllMusclesGroups();
  }
}
