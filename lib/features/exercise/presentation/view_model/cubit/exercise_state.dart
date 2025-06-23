part of 'exercise_cubit.dart';

sealed class ExerciseState extends Equatable {
  const ExerciseState();

  @override
  List<Object> get props => [];
}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseFailuer extends ExerciseState {
  final String message;
  const ExerciseFailuer({required this.message});
}

final class LevelSuccess extends ExerciseState {
  final LevelsByMusclesModel? levelsByMusclesModel;
  final ExerciseByPrimeMoverAndDifficultyResponse?
  exerciseByPrimeMoverAndDifficultyResponse;
  final Exercise? exercise;
  const LevelSuccess({
    this.exerciseByPrimeMoverAndDifficultyResponse,
    this.levelsByMusclesModel,
    this.exercise,
  });
}

final class ExerciseSuccess extends ExerciseState {
 
  final ExerciseByPrimeMoverAndDifficultyResponse
  exerciseByPrimeMoverAndDifficultyResponse;
  
  const ExerciseSuccess({required this.exerciseByPrimeMoverAndDifficultyResponse});
}
