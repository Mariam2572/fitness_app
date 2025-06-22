

import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/base/api_result.dart';
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

    final userResult = await homeUseCase.getUserName();
    if (userResult is ApiError<String>) {
      emit(HomeError(userResult.message ?? "Failed to load username"));
      return;
    }
    var username;
    if(userResult is ApiSuccess<String>){

      username = userResult.data ?? "Username not found";
    }

    final exerciseResult = await homeUseCase.getRandomExercise();
    if (exerciseResult is ApiError<RandomExerciseResponse>) {
      emit(HomeError(exerciseResult.message ?? "Failed to load exercises"));
      return;
    }
   var exercises;
    if (exerciseResult is ApiSuccess<RandomExerciseResponse>) {
       exercises = exerciseResult.data?.exercises ?? [];
    }

    emit(HomeSuccess(userName: username??"Username not found", exercises: exercises));

  }



}

sealed class HomeIntent {}

final class InitialLoad extends HomeIntent{}