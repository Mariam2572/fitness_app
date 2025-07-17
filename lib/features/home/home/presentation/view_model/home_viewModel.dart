// import 'dart:developer';
// import 'package:bloc/bloc.dart';
// import 'package:fitness_app/core/base/api_result.dart';
// import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
// import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
// import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
// import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
// import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
// import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
// import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class HomeViewModel extends Cubit<HomeState>{
//   HomeViewModel(this.homeUseCase) : super(HomeInitial());
//   final HomeUseCase homeUseCase;

//   Future<void> doIntent(HomeIntent intent) async {
//     if (intent is InitialLoad) {
//       await _fetchUserNameAndExercises();
//     }
//   }

//   Future<void> _fetchUserNameAndExercises() async {
//     emit(HomeLoading());
// //Get Username
//     String? userName;
//     String? userError;
//     final userResult = await homeUseCase.getUserName();
//     if (userResult is ApiSuccess<String>) {
//       userName = userResult.data ?? "Unknown User";
//     } else if (userResult is ApiError<String>) {
//       userError = userResult.message;
//     }
// //Random Exercises
//     List<Exercises>? exercises;
//     String? exerciseError;
//     final exerciseResult = await homeUseCase.getRandomExercise();
//     if (exerciseResult is ApiSuccess<RandomExerciseResponse>) {
//       exercises = exerciseResult.data?.exercises ?? [];
//     } else if (exerciseResult is ApiError<RandomExerciseResponse>) {
//       exerciseError = exerciseResult.message;
//     }
//     // //All Exercises
//     // List<Exercises>? allExercises;
//     // String? allExercisesError;

//     // final allResult = await homeUseCase.getAllExercises();
//     // if (allResult is ApiSuccess<ExercisesResponse>) {
//     //   allExercises = allResult.data?.exercises ?? [];
//     // } else if (allResult is ApiError<ExercisesResponse>) {
//     //   allExercisesError = allResult.message;
//     // }
    
// GetAllMusclesGroupsReponse ? getAllMusclesGroupsReponse;

//     String? musclesGroupsError;
//     final musclesGroups = await homeUseCase.getAllMusclesGroups();
//     if (musclesGroups is ApiSuccess<GetAllMusclesGroupsReponse>) {
//       getAllMusclesGroupsReponse = musclesGroups.data;
//     } else if (musclesGroups is ApiError<GetAllMusclesGroupsReponse>) {
//       musclesGroupsError = musclesGroups.message;
//     }
// //Get Food
//     List<FoodCategory>? categories;
//     String? mealsError;
//     final mealsCategories = await homeUseCase.getMealsCategories();
//     if (mealsCategories is ApiSuccess<FoodCategoriesResponse>) {
//       categories = mealsCategories.data?.categories;
//     } else if (mealsCategories is ApiError<FoodCategoriesResponse>) {
//       mealsError = mealsCategories.message;
//     }

//     log(" categories in the print of the viewModel $categories");
//     emit(HomeSuccess(
//       userName: userName,
//       // allExercises: allExercises,
//       // allExercisesError:allExercisesError,
//       exercises: exercises,
//       categories: categories,
//       userError: userError,
//       exerciseError: exerciseError,
//       mealsError: mealsError,
//       musclesGroups: getAllMusclesGroupsReponse
//     ));
//   }




// }

// sealed class HomeIntent {}

// final class InitialLoad extends HomeIntent{}

















// // import 'dart:developer';
// // import 'package:bloc/bloc.dart';
// // import 'package:fitness_app/core/base/api_result.dart';
// // import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
// // import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
// // import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
// // import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
// // import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
// // import 'package:injectable/injectable.dart';
// // import 'home_state.dart';

// // @injectable
// // class HomeViewModel extends Cubit<HomeState> {
// //   HomeViewModel(this._homeUseCase) : super(HomeInitial());

// //   final HomeUseCase _homeUseCase;

// //   Future<void> doIntent(HomeIntent intent, GetMealsCategoriesIntent getMealsCategoriesIntent) async {
// //     emit(HomeLoading());

// //     switch (intent) {
// //       case GetUserNameIntent():
// //         await _getUserName();

// //       case GetRandomExercisesIntent():
// //         await _getRandomExercises(
// //           intent.primeMoverMuscleId,
// //           intent.difficultyLevelId,
// //         );

// //       case GetMealsCategoriesIntent():
// //         await _getMealsCategories();
// //     }
// //   }

// //   // Future<void> _fetchAllHomeData() async {
// //   //   emit(HomeLoading());

// //   //   try {
// //   //     final userName = await _getUserName();
// //   //     final exercises = await _getRandomExercises();
// //   //     final allExercises = await _getAllExercises();
// //   //     final categories = await _getMealsCategories();

// //   //     emit(
// //   //       HomeSuccess(
// //   //         userName: userName,
// //   //         exercises: exercises,
// //   //         allExercises: allExercises,
// //   //         categories: categories,
// //   //       ),
// //   //     );
// //   //   } catch (e) {
// //   //     emit(HomeError(e.toString()));
// //   //   }
// //   // }

// //   // Future<String?> _getUserName() async {
// //   //   final result = await _homeUseCase.getUserName();
// //   //   switch (result) {
// //   //     case ApiSuccess<String>():
// //   //       return result.data ?? 'Unknown User';
// //   //     case ApiError<String>():
// //   //       throw result.message;
// //   //     default:
// //   //       throw 'Unknown error occurred while fetching user name';
// //   //   }
// //   // }
// //   Future<void> _getUserName() async {
// //     final response = await _homeUseCase.getUserName();
// //     if (response is ApiSuccess<String>) {
// //       emit(HomeSuccess(userName: response.data ?? 'Unknown User'));
// //     } else if (response is ApiError<String>) {
// //       emit(
// //         HomeError(
// //           response.failure?.errorMessage ?? "An error occurred , try later",
// //         ),
// //       );
// //     }
// //   }

// //   // Future<List<Exercises>> _getRandomExercises() async {
// //   //   final result = await _homeUseCase.getRandomExercise(
// //   //     primeMoverMuscleId: '',
// //   //     difficultyLevelId: '',
// //   //   );
// //   //   switch (result) {
// //   //     case ApiSuccess<RandomExerciseResponse>():
// //   //       return result.data?.exercises ?? [];
// //   //     case ApiError<RandomExerciseResponse>():
// //   //       throw result.message;
// //   //     default:
// //   //       throw 'Unknown error occurred while fetching exercises';
// //   //   }
// //   // }
// //   Future<void> _getRandomExercises(
// //     String primeMoverMuscleId,
// //     String difficultyLevelId,
// //   ) async {
// //     final response = await _homeUseCase.getRandomExercise(
// //       primeMoverMuscleId: primeMoverMuscleId,
// //       difficultyLevelId: difficultyLevelId,
// //     );
// //     if (response is ApiSuccess<RandomExerciseResponse>) {
// //       emit(HomeSuccess(exercises: response.data?.exercises ?? []));
// //     } else if (response is ApiError<RandomExerciseResponse>) {
// //       emit(HomeError(response.failure?.errorMessage ?? 'An error occurred'));
// //     }
// //   }

// //   // Future<List<Exercises>> _getAllExercises() async {
// //   //   final result = await _homeUseCase.getAllExercises();
// //   //   switch (result) {
// //   //     case ApiSuccess<ExercisesResponse>():
// //   //       return result.data?.exercises ?? [];
// //   //     case ApiError<ExercisesResponse>():
// //   //       throw result.message;
// //   //     default:
// //   //       throw 'Unknown error occurred while fetching all exercises';
// //   //   }
// //   // }

// //   // Future<List<FoodCategory>> _getMealsCategories() async {
// //   //   final result = await _homeUseCase.getMealsCategories();
// //   //   switch (result) {
// //   //     case ApiSuccess<FoodCategoriesResponse>():
// //   //       log(" categories in ViewModel: ${result.data?.categories}");
// //   //       return result.data?.categories ?? [];
// //   //     case ApiError<FoodCategoriesResponse>():
// //   //       throw result.message;
// //   //     default:
// //   //       throw 'Unknown error occurred while fetching meals categories';
// //   //   }
// //   // }
// //   Future<void> _getMealsCategories() async {
// //     final response = await _homeUseCase.getMealsCategories();

// //     if (response is ApiSuccess<FoodCategoriesResponse>) {
// //       emit(HomeSuccess(categories: response.data?.categories ?? []));
// //     } else if (response is ApiError<FoodCategoriesResponse>) {
// //       emit(HomeError(response.failure?.errorMessage ?? 'An error occurred'));
// //     }
// //   }
// // }

// // sealed class HomeIntent {}

// // final class GetUserNameIntent extends HomeIntent {}

// // final class GetRandomExercisesIntent extends HomeIntent {
// //   final String primeMoverMuscleId;
// //   final String difficultyLevelId;
// //   GetRandomExercisesIntent({
// //     required this.primeMoverMuscleId,
// //     required this.difficultyLevelId,
// //   });
// // }

// // final class GetMealsCategoriesIntent extends HomeIntent {}
