part of 'home_view_cubit.dart';

sealed class HomeViewState extends Equatable {
  const HomeViewState();

  @override
  List<Object> get props => [];
}

final class HomeViewInitial extends HomeViewState {}

final class HomeViewLoading extends HomeViewState {}

final class HomeViewSuccess extends HomeViewState {
  final String? userName;
  final String? userImage;
  final List<Exercises>? exercises;
  final List<FoodCategory>? mealsCategories;
  final GetAllMusclesGroupsReponse? musclesGroups;
  final List<MusclesBean>? workoutsByMuscleGroupId;
  
  const HomeViewSuccess({
    this.userName,
    this.exercises,
    this.mealsCategories,
    this.musclesGroups,
    this.workoutsByMuscleGroupId,
    this.userImage, 
 
  });
}


final class GetMusclesByMuscleGroupIdSuccess extends HomeViewState {
  final List<MusclesBean>? workoutsByMuscleGroupId;
  const GetMusclesByMuscleGroupIdSuccess({
    required this.workoutsByMuscleGroupId,
  });
}

final class GetMusclesByMuscleGroupIdError extends HomeViewState {
  final String? errorMessage;

  const GetMusclesByMuscleGroupIdError({required this.errorMessage});
}

final class HomeViewError extends HomeViewState {
  final String? userNameError;
  final String? randomExercisesError;
  final String? mealsCategoriesError;
  final String? musclesGroupsError;
  final String? musclesByMuscleGroupIdError;
  const HomeViewError({
    this.userNameError,
    this.randomExercisesError,
    this.mealsCategoriesError,
    this.musclesGroupsError,
    this.musclesByMuscleGroupIdError,
  });
}
