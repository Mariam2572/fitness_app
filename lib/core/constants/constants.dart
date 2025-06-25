class Constants {
  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1/';
  static const String mealBaseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  static const String userToken = 'userToken';
  static const String loginEndPoint = "auth/signin";
  static const String registerEndPoint = 'auth/signup';
  static const String getAllMusclesGroupsEndPoint = 'muscles';
  static const String getAllMusclesByMuscleGroupIdEndPoint = 'musclesGroup';

  static const String getMealsDetailsEndPoint = "lookup.php?i={i}";
  static const String getExerciseByMoverAndDifficultyEndPoint = "exercises/by-muscle-difficulty";
  static const String levelsByMuscleEndPoint = 'levels/difficulty-levels/by-prime-mover';
}
