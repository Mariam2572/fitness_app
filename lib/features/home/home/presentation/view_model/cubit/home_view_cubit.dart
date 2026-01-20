import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/exercises.dart';
import 'package:fitness_app/features/home/home/data/models/random_exercise_response.dart';
import 'package:fitness_app/features/home/home/data/models/user_response.dart';
import 'package:fitness_app/features/home/home/domain/use_cases/home_use_case.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeUseCase) : super(const HomeViewState());
  final HomeUseCase homeUseCase;
  Future<void> doIntent(HomeIntent intent) async {
    switch (intent) {
      case GetUserDataIntent():
        await _getUserData();
      case GetWorkoutRecommendationsIntent():
        await _getWorkoutRecommendations();
      case GetMealsCategoriesIntent():
        await _getMealsCategories();
      case GetMusclesGroupsIntent():
        await _getMusclesGroups();
      case GetWorkoutsByMuscleGroupIdIntent():
        await _getWorkoutsByMuscleGroupId(intent.id);
      case GetHomeDataIntent():
        await _getHomeData();
    }
  }

  /// Fetches all initial home data by calling individual section handlers
  /// Each section loads independently without waiting for others
  Future<void> _getHomeData() async {
    // Fire all requests independently - don't wait for them
    // This allows each section to show loading/success states independently
    _getUserData();
    _getWorkoutRecommendations();
    _getMealsCategories();
    _getMusclesGroups();
  }

  /// Fetches user data independently
  Future<void> _getUserData() async {
    emit(state.copyWith(userDataStatus: HomeDataStatus.loading));

    final result = await homeUseCase.getUserName();

    switch (result) {
      case ApiSuccess<UserResponse>():
        emit(
          state.copyWith(
            userDataStatus: HomeDataStatus.success,
            userName: result.data?.user?.firstName ?? "Unknown User",
            userImage: result.data?.user?.photo,
          ),
        );
      case ApiError<UserResponse>():
        emit(
          state.copyWith(
            userDataStatus: HomeDataStatus.failure,
            userDataError: result.failure?.errorMessage,
          ),
        );
    }
  }

  /// Fetches workout recommendations independently
  Future<void> _getWorkoutRecommendations() async {
    emit(state.copyWith(workoutRecommendationsStatus: HomeDataStatus.loading));

    final result = await homeUseCase.getRandomExercise();

    switch (result) {
      case ApiSuccess<RandomExerciseResponse>():
        emit(
          state.copyWith(
            workoutRecommendationsStatus: HomeDataStatus.success,
            workoutRecommendations: result.data?.exercises ?? [],
          ),
        );
      case ApiError<RandomExerciseResponse>():
        emit(
          state.copyWith(
            workoutRecommendationsStatus: HomeDataStatus.failure,
            workoutRecommendationsError: result.failure?.errorMessage,
          ),
        );
    }
  }

  /// Fetches meals categories independently
  Future<void> _getMealsCategories() async {
    emit(state.copyWith(mealsCategoriesStatus: HomeDataStatus.loading));

    final result = await homeUseCase.getMealsCategories();

    switch (result) {
      case ApiSuccess<FoodCategoriesResponse>():
        emit(
          state.copyWith(
            mealsCategoriesStatus: HomeDataStatus.success,
            mealsCategories: result.data?.categories ?? [],
          ),
        );
      case ApiError<FoodCategoriesResponse>():
        emit(
          state.copyWith(
            mealsCategoriesStatus: HomeDataStatus.failure,
            mealsCategoriesError: result.failure?.errorMessage,
          ),
        );
    }
  }

  /// Fetches muscles groups independently
  Future<void> _getMusclesGroups() async {
    emit(state.copyWith(musclesGroupsStatus: HomeDataStatus.loading));

    final result = await homeUseCase.getAllMusclesGroups();

    switch (result) {
      case ApiSuccess<GetAllMusclesGroupsReponse>():
        emit(
          state.copyWith(
            musclesGroupsStatus: HomeDataStatus.success,
            musclesGroups: result.data,
          ),
        );
      case ApiError<GetAllMusclesGroupsReponse>():
        emit(
          state.copyWith(
            musclesGroupsStatus: HomeDataStatus.failure,
            musclesGroupsError: result.failure?.errorMessage,
          ),
        );
    }
  }

  /// Fetches workouts by muscle group ID independently
  Future<void> _getWorkoutsByMuscleGroupId(String id) async {
    emit(state.copyWith(workoutsByMuscleGroupStatus: HomeDataStatus.loading));

    final result = await homeUseCase.getWorkoutsExercise(id);

    switch (result) {
      case ApiSuccess<GetAllMusclesByMuscleGroupIdReponse>():
        emit(
          state.copyWith(
            workoutsByMuscleGroupStatus: HomeDataStatus.success,
            workoutsByMuscleGroup: result.data?.muscles ?? [],
          ),
        );
      case ApiError<GetAllMusclesByMuscleGroupIdReponse>():
        emit(
          state.copyWith(
            workoutsByMuscleGroupStatus: HomeDataStatus.failure,
            workoutsByMuscleGroupError: result.failure?.errorMessage,
          ),
        );
    }
  }
}

sealed class HomeIntent {}

class GetUserDataIntent extends HomeIntent {}

class GetWorkoutRecommendationsIntent extends HomeIntent {}

class GetMealsCategoriesIntent extends HomeIntent {}

class GetMusclesGroupsIntent extends HomeIntent {}

class GetWorkoutsByMuscleGroupIdIntent extends HomeIntent {
  final String id;
  GetWorkoutsByMuscleGroupIdIntent({required this.id});
}

class GetHomeDataIntent extends HomeIntent {}
