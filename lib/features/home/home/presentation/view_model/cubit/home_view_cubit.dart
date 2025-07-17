import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/Exercises.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:flutter/material.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeUseCase) : super(HomeViewInitial());
  final HomeUseCase homeUseCase;
  
  List<MusclesGroupBean> musclesGroupCat = [];


  Future<void> doIntent(HomeIntent intent) async {
    switch (intent) {
      case GetMusclesByMuscleGroupIdIntent():
        await _getMusclesByMuscleGroupId(intent);

      case HomeViewDataIntent():
        await _getHomeData();
    }
  }

  Future<void> _getHomeData() async {
    emit(HomeViewLoading());
    final userName = await homeUseCase.getUserName();
    final randomExercises = await homeUseCase.getRandomExercise();
    final mealsCat = await homeUseCase.getMealsCategories();
    final musclesGroups = await homeUseCase.getAllMusclesGroups();

    if (userName is ApiSuccess<String> &&
        randomExercises is ApiSuccess<RandomExerciseResponse> &&
        mealsCat is ApiSuccess<FoodCategoriesResponse> &&
        musclesGroups is ApiSuccess<GetAllMusclesGroupsReponse>) {
      musclesGroupCat = musclesGroups.data?.musclesGroup ?? [];
      emit(
        HomeViewSuccess(
          userName: userName.data ?? "Unknown User",
          exercises: randomExercises.data?.exercises ?? [],
          mealsCategories: mealsCat.data?.categories ?? [],
          musclesGroups: musclesGroups.data!,
        ),
      );
    } else if (userName is ApiError<String> &&
        randomExercises is ApiError<RandomExerciseResponse> &&
        mealsCat is ApiError<FoodCategoriesResponse> &&
        musclesGroups is ApiError<GetAllMusclesGroupsReponse>) {
      emit(
        HomeViewError(
          userNameError: userName.failure?.errorMessage,
          randomExercisesError: randomExercises.failure?.errorMessage,
          mealsCategoriesError: mealsCat.failure?.errorMessage,
          musclesGroupsError: musclesGroups.failure?.errorMessage,
        ),
      );
    }
  }

  Future<void> _getMusclesByMuscleGroupId(
    GetMusclesByMuscleGroupIdIntent initen,
  ) async {
    emit(HomeViewLoading());
    final result = await homeUseCase.getWorkoutsExercise(initen.id);
    switch (result) {
      case ApiSuccess<GetAllMusclesByMuscleGroupIdReponse>():
       
        emit(
          GetMusclesByMuscleGroupIdSuccess(
            workoutsByMuscleGroupId: result.data?.muscles,
          ),
        );
      case ApiError<GetAllMusclesByMuscleGroupIdReponse>():
        emit(
          HomeViewError(
            musclesByMuscleGroupIdError: result.failure?.errorMessage,
          ),
        );
    }
  }
}

sealed class HomeIntent {}

class GetMusclesByMuscleGroupIdIntent extends HomeIntent {
  final String id;

  GetMusclesByMuscleGroupIdIntent({required this.id});
}

class HomeViewDataIntent extends HomeIntent {}
