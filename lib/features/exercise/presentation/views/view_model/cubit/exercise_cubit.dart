import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit(this._getLevelsByPrimeMoverMusclesUseCase)
    : super(ExerciseInitial());
  final GetLevelsByPrimeMoverMuscleUseCases _getLevelsByPrimeMoverMusclesUseCase;
   
   doIntent(LevelsByMusclesIntent intent) {
     if (intent is GetLevelsByPrimeMoverMusclesIntent) {
       _getLevelsByPrimeMoverMuscles(intent.primeMoverMuscleId);
     }
   }

  Future<void> _getLevelsByPrimeMoverMuscles(String primeMoverMuscleId) async {
    emit(ExerciseLoading());
    final response = await _getLevelsByPrimeMoverMusclesUseCase(primeMoverMuscleId: primeMoverMuscleId);
    switch (response) {
      case ApiError<LevelsByMusclesModel>():
        emit(ExerciseFailuer(message: response.failure?.errorMessage ?? 'An error occurred'));
        break;
      case ApiSuccess<LevelsByMusclesModel>():
        emit(ExerciseSuccess(levelsByMusclesModel:  response.data!));
        break;
      default:
        break;
    }
  }
}

class ExerciseFailure {
}
sealed class LevelsByMusclesIntent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLevelsByPrimeMoverMusclesIntent extends LevelsByMusclesIntent {
  final String primeMoverMuscleId;
  GetLevelsByPrimeMoverMusclesIntent(this.primeMoverMuscleId);
}