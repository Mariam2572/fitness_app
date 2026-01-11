part of 'home_view_cubit.dart';

/// Enum representing the status of data loading for each home section
enum HomeDataStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == HomeDataStatus.initial;
  bool get isLoading => this == HomeDataStatus.loading;
  bool get isSuccess => this == HomeDataStatus.success;
  bool get isFailure => this == HomeDataStatus.failure;
}

/// Unified state for Home view with independent section statuses
class HomeViewState extends Equatable {
  // User Data Section
  final HomeDataStatus userDataStatus;
  final String? userName;
  final String? userImage;
  final String? userDataError;

  // Workout Recommendations Section
  final HomeDataStatus workoutRecommendationsStatus;
  final List<Exercises> workoutRecommendations;
  final String? workoutRecommendationsError;

  // Meals Categories Section
  final HomeDataStatus mealsCategoriesStatus;
  final List<FoodCategory> mealsCategories;
  final String? mealsCategoriesError;

  // Muscles Groups Section
  final HomeDataStatus musclesGroupsStatus;
  final GetAllMusclesGroupsReponse? musclesGroups;
  final String? musclesGroupsError;

  // Workouts by Muscle Group Section
  final HomeDataStatus workoutsByMuscleGroupStatus;
  final List<MusclesBean> workoutsByMuscleGroup;
  final String? workoutsByMuscleGroupError;

  const HomeViewState({
    this.userDataStatus = HomeDataStatus.initial,
    this.userName,
    this.userImage,
    this.userDataError,
    this.workoutRecommendationsStatus = HomeDataStatus.initial,
    this.workoutRecommendations = const [],
    this.workoutRecommendationsError,
    this.mealsCategoriesStatus = HomeDataStatus.initial,
    this.mealsCategories = const [],
    this.mealsCategoriesError,
    this.musclesGroupsStatus = HomeDataStatus.initial,
    this.musclesGroups,
    this.musclesGroupsError,
    this.workoutsByMuscleGroupStatus = HomeDataStatus.initial,
    this.workoutsByMuscleGroup = const [],
    this.workoutsByMuscleGroupError,
  });

  HomeViewState copyWith({
    HomeDataStatus? userDataStatus,
    String? userName,
    String? userImage,
    String? userDataError,
    HomeDataStatus? workoutRecommendationsStatus,
    List<Exercises>? workoutRecommendations,
    String? workoutRecommendationsError,
    HomeDataStatus? mealsCategoriesStatus,
    List<FoodCategory>? mealsCategories,
    String? mealsCategoriesError,
    HomeDataStatus? musclesGroupsStatus,
    GetAllMusclesGroupsReponse? musclesGroups,
    String? musclesGroupsError,
    HomeDataStatus? workoutsByMuscleGroupStatus,
    List<MusclesBean>? workoutsByMuscleGroup,
    String? workoutsByMuscleGroupError,
  }) {
    return HomeViewState(
      userDataStatus: userDataStatus ?? this.userDataStatus,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      userDataError: userDataError ?? this.userDataError,
      workoutRecommendationsStatus:
          workoutRecommendationsStatus ?? this.workoutRecommendationsStatus,
      workoutRecommendations:
          workoutRecommendations ?? this.workoutRecommendations,
      workoutRecommendationsError:
          workoutRecommendationsError ?? this.workoutRecommendationsError,
      mealsCategoriesStatus:
          mealsCategoriesStatus ?? this.mealsCategoriesStatus,
      mealsCategories: mealsCategories ?? this.mealsCategories,
      mealsCategoriesError: mealsCategoriesError ?? this.mealsCategoriesError,
      musclesGroupsStatus: musclesGroupsStatus ?? this.musclesGroupsStatus,
      musclesGroups: musclesGroups ?? this.musclesGroups,
      musclesGroupsError: musclesGroupsError ?? this.musclesGroupsError,
      workoutsByMuscleGroupStatus:
          workoutsByMuscleGroupStatus ?? this.workoutsByMuscleGroupStatus,
      workoutsByMuscleGroup:
          workoutsByMuscleGroup ?? this.workoutsByMuscleGroup,
      workoutsByMuscleGroupError:
          workoutsByMuscleGroupError ?? this.workoutsByMuscleGroupError,
    );
  }

  @override
  List<Object?> get props => [
    userDataStatus,
    userName,
    userImage,
    userDataError,
    workoutRecommendationsStatus,
    workoutRecommendations,
    workoutRecommendationsError,
    mealsCategoriesStatus,
    mealsCategories,
    mealsCategoriesError,
    musclesGroupsStatus,
    musclesGroups,
    musclesGroupsError,
    workoutsByMuscleGroupStatus,
    workoutsByMuscleGroup,
    workoutsByMuscleGroupError,
  ];
}
