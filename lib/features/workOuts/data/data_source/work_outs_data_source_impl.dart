import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/workOuts/domain/data_source/work_outs_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkOutsDataSource)
class WorkOutsDataSourceImpl implements WorkOutsDataSource {
  final ApiService _apiService;

  WorkOutsDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<GetAllMusclesGroupsReponse>> getAllMusclesGroups() async {
    return await apiExecuter<GetAllMusclesGroupsReponse>(
      () async => await _apiService.getAllMusclesGroups(),
      '',
    );
  }

  @override
  Future<ApiResult<GetAllMusclesByMuscleGroupIdReponse>>
  getAllMusclesByMuscleGroupId(String id) async {
    return await apiExecuter<GetAllMusclesByMuscleGroupIdReponse>(
      () async => await _apiService.getAllMusclesByMuscleGroupId(id),
      '',
    );
  }
}
