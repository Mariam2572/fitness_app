import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise_by_prime_mover_and_difficulty_response.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_exercise_by_mover_and_difficulty_level.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit(
    this._getLevelsByPrimeMoverMusclesUseCase,
    this._getExerciseByMoverAndDifficultyLevelUseCase,
  ) : super(ExerciseInitial());
  final GetLevelsByPrimeMoverMuscleUseCases
  _getLevelsByPrimeMoverMusclesUseCase;
  final GetExerciseByMoverAndDifficultyLevelUseCase
  _getExerciseByMoverAndDifficultyLevelUseCase;

  doIntent(ExerciseIntent intent) {
    switch (intent) {
      case GetLevelsByPrimeMoverMusclesIntent():
        {
          _getLevelsByPrimeMoverMuscles(intent.primeMoverMuscleId);
        }
      case GetExerciseByMoverAndDifficulty():
        _getExerciseByMoverAndDifficulty(
          primeMoverMuscleId: intent.primeMoverMuscleId,
          difficultyLevelId: intent.difficultyLevelId,
        );
    }
  }

  Future<void> _getLevelsByPrimeMoverMuscles(String primeMoverMuscleId) async {
    emit(ExerciseLoading());
    final response = await _getLevelsByPrimeMoverMusclesUseCase(
      primeMoverMuscleId: primeMoverMuscleId,
    );
    switch (response) {
      case ApiError<LevelsByMusclesModel>():
        emit(
          ExerciseFailuer(
            message: response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
        break;
      case ApiSuccess<LevelsByMusclesModel>():
        emit(ExerciseSuccess(levelsByMusclesModel: response.data!));
        break;
      default:
        break;
    }
  }

  Future<void> _getExerciseByMoverAndDifficulty({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) async {
    emit(ExerciseLoading());
    final response = await _getExerciseByMoverAndDifficultyLevelUseCase.call(
      primeMoverMuscleId: primeMoverMuscleId,
      difficultyLevelId: difficultyLevelId,
    );
    switch (response) {
      case ApiSuccess<ExerciseByPrimeMoverAndDifficultyResponse>():
        {
          emit(
            ExerciseSuccess(
              exerciseByPrimeMoverAndDifficultyResponse: response.data,
              
            ),
          );
        }
      case ApiError<ExerciseByPrimeMoverAndDifficultyResponse>():
        {
          emit(
            ExerciseFailuer(
              message:
                  response.failure?.errorMessage ??
                  'An error occurred , try later',
            ),
          );
        }

        break;
    }
  }
}

// class ExerciseFailure {}

sealed class ExerciseIntent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLevelsByPrimeMoverMusclesIntent extends ExerciseIntent {
  final String primeMoverMuscleId;
  GetLevelsByPrimeMoverMusclesIntent(this.primeMoverMuscleId);
}

class GetExerciseByMoverAndDifficulty extends ExerciseIntent {
  final String primeMoverMuscleId;
  final String difficultyLevelId;

  GetExerciseByMoverAndDifficulty({
    required this.primeMoverMuscleId,
    required this.difficultyLevelId,
  });
}
