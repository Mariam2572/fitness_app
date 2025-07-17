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
  final List<Exercises>? exercises;
  final List<FoodCategory>? mealsCategories;
  final GetAllMusclesGroupsReponse? musclesGroups;
  final List<MusclesBean>? workoutsByMuscleGroupId;
  // final GetAllMusclesByMuscleGroupIdReponse? musclesByMuscleGroupId;
  const HomeViewSuccess({
    this.userName,
    this.exercises,
    this.mealsCategories,
    this.musclesGroups,
    this.workoutsByMuscleGroupId,
    // this.musclesByMuscleGroupId,
  });
}
// final class GetUserNameSuccess extends HomeViewState {
//   final String userName;

//   const GetUserNameSuccess({required this.userName});
// }

// final class GetRandomExercisesSuccess extends HomeViewState {
//   final List<Exercises>? exercises;

//   const GetRandomExercisesSuccess({required this.exercises});
// }

// final class GetFoodCategorySuccess extends HomeViewState {
//   final List<FoodCategory>? categories;

//   const GetFoodCategorySuccess({required this.categories});
// }

// final class GetAllMusclesGroupsSuccess extends HomeViewState {
//   final GetAllMusclesGroupsReponse? musclesGroups;

//   const GetAllMusclesGroupsSuccess({required this.musclesGroups});
// }

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
