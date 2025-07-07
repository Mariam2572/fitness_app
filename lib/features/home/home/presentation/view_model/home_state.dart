import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final String? userName;
  final List<Exercises>? exercises;
  final List<Exercises>? allExercises;
  final List<FoodCategory>? categories;
  final String? userError;
  final String? exerciseError;
  final String? mealsError;
  final String? allExercisesError;
  final GetAllMusclesGroupsReponse? musclesGroups;

  HomeSuccess( {
    this.userName,
    this.exercises,
    this.categories,
    this.userError,
    this.exerciseError,
    this.mealsError,
    this.allExercises,
    this.allExercisesError,
    this.musclesGroups,
  });

  @override
  List<Object?> get props => [userName, exercises, categories, userError, exerciseError, mealsError,allExercises,allExercisesError];
}


final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
// import 'package:equatable/equatable.dart';
// import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
// import 'package:fitness_app/features/home/home/data/models/Exercises.dart';

// sealed class HomeState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// final class HomeInitial extends HomeState {}

// final class HomeLoading extends HomeState {}

// final class HomeSuccess extends HomeState {
//   final String? userName;
//   final List<Exercises>? exercises;
//   // final List<Exercises>? allExercises;
//   final List<FoodCategory>? categories;

//   HomeSuccess({
//     this.userName,
//     this.exercises,
//     // this.allExercises,
//     this.categories,
//   });

//   @override
//   List<Object?> get props => [
//         userName,
//         exercises,
//         // allExercises,
//         categories,
//       ];
// }

// final class HomeError extends HomeState {
//   final String message;

//   HomeError(this.message);

//   @override
//   List<Object?> get props => [message];
// }
