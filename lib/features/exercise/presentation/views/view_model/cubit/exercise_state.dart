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

final class ExerciseSuccess extends ExerciseState {
  final LevelsByMusclesModel levelsByMusclesModel;
  const ExerciseSuccess({required this.levelsByMusclesModel});
}
