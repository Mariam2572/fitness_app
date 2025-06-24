import 'package:fitness_app/core/base/api_result.dart';

import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/workOuts/domain/repos/work_outs_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllMusclesGroupsUseCase {
  final WorkOutsRepo _workOutsRepo;
  GetAllMusclesGroupsUseCase(this._workOutsRepo);
  Future<ApiResult<GetAllMusclesGroupsReponse>>  invoke() async {
    return await _workOutsRepo.getAllMusclesGroups();
  }
}