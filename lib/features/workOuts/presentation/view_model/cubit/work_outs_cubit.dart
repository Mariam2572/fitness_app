import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';

part 'work_outs_state.dart';

class WorkOutsCubit extends Cubit<WorkOutsState> {
  final GetAllMusclesGroupsUseCase _getAllMusclesGroupsUseCase;
  final GetAllMusclesByMuscleGroupIdUseCase _getAllMusclesByMuscleGroupIdUseCase;

  WorkOutsCubit(this._getAllMusclesGroupsUseCase,this._getAllMusclesByMuscleGroupIdUseCase) : super(WorkOutsInitial());
  void doIntent(WorkOutsIntent intent) {
    switch (intent) {
      case GetAllMusclesGroupsIntent():
        _getAllMusclesGroups();
        break;
      case GetAllMusclesByMuscleGroupIdIntent():
        _getAllMusclesByMuscleGroupId(intent);
        break;
    }
  }

  Future<void> _getAllMusclesGroups() async {
    emit(WorkOutsLoading());
    final response = await _getAllMusclesGroupsUseCase.invoke();
    switch (response) {
      case ApiError<GetAllMusclesGroupsReponse>():
        emit(
          WorkOutsFailure(
            response.failure?.errorMessage ?? 'An error occurred',          ),
        );
      case ApiSuccess<GetAllMusclesGroupsReponse>():{
        emit(WorkOutsSuccess(response.data!));
      _getAllMusclesByMuscleGroupId(GetAllMusclesByMuscleGroupIdIntent(id: response.data!.musclesGroup![0].id!));
      }
      }

  }
  Future<void> _getAllMusclesByMuscleGroupId(GetAllMusclesByMuscleGroupIdIntent intent) async {
    emit(WorkOutsLoading());
    final response = await _getAllMusclesByMuscleGroupIdUseCase.invoke(intent.id);
    switch (response) {
      case ApiError<GetAllMusclesByMuscleGroupIdReponse>():
        emit(
          WorkOutsByIdFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<GetAllMusclesByMuscleGroupIdReponse>():
        emit(WorkOutsByIdSuccess(response.data!));
      }

  }

}

sealed class WorkOutsIntent {}

class GetAllMusclesGroupsIntent extends WorkOutsIntent {

}
class GetAllMusclesByMuscleGroupIdIntent extends WorkOutsIntent {
  String id;
  GetAllMusclesByMuscleGroupIdIntent({required this.id});
}
