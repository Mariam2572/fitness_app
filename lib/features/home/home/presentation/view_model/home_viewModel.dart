

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{
  HomeViewModel(this.homeUseCase) : super(HomeInitial());
  final HomeUseCase homeUseCase;

  Future<void> doIntent(HomeIntent intent) async {
    if (intent is InitialLoad) {
      await _fetchUserNameAndExercises();
    }
  }

  Future<void> _fetchUserNameAndExercises() async {
    emit(HomeLoading());
//Get Username
    String? userName;
    String? userError;
    final userResult = await homeUseCase.getUserName();
    if (userResult is ApiSuccess<String>) {
      userName = userResult.data ?? "Unknown User";
    } else if (userResult is ApiError<String>) {
      userError = userResult.message;
    }
//Random Exercises
    List<Exercises>? exercises;
    String? exerciseError;
    final exerciseResult = await homeUseCase.getRandomExercise();
    if (exerciseResult is ApiSuccess<RandomExerciseResponse>) {
      exercises = exerciseResult.data?.exercises ?? [];
    } else if (exerciseResult is ApiError<RandomExerciseResponse>) {
      exerciseError = exerciseResult.message;
    }
    //All Exercises
    List<Exercises>? allExercises;
    String? allExercisesError;

    final allResult = await homeUseCase.getAllExercises();
    if (allResult is ApiSuccess<ExercisesResponse>) {
      allExercises = allResult.data?.exercises ?? [];
    } else if (allResult is ApiError<ExercisesResponse>) {
      allExercisesError = allResult.message;
    }

//Get Food
    List<FoodCategory>? categories;
    String? mealsError;
    final mealsCategories = await homeUseCase.getMealsCategories();
    if (mealsCategories is ApiSuccess<FoodCategoriesResponse>) {
      categories = mealsCategories.data?.categories;
    } else if (mealsCategories is ApiError<FoodCategoriesResponse>) {
      mealsError = mealsCategories.message;
    }

    log(" categories in the print of the viewModel $categories");
    emit(HomeSuccess(
      userName: userName,
      allExercises: allExercises,
      allExercisesError:allExercisesError,
      exercises: exercises,
      categories: categories,
      userError: userError,
      exerciseError: exerciseError,
      mealsError: mealsError,
    ));
  }




}

sealed class HomeIntent {}

final class InitialLoad extends HomeIntent{}