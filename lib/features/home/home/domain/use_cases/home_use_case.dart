
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/home/home/data/models/ExercisesResponse.dart';
import 'package:fitness_app/features/home/home/data/models/RandomExerciseResponse.dart';
import 'package:fitness_app/features/home/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:fitness_app/features/workOuts/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase{

  final HomeRepo homeRepo;
final GetAllMusclesGroupsUseCase getAllMusclesGroupsUseCase;
final GetAllMusclesByMuscleGroupIdUseCase getAllMusclesByMuscleGroupIdUseCase;
  HomeUseCase(this.homeRepo, this.getAllMusclesGroupsUseCase, this.getAllMusclesByMuscleGroupIdUseCase);

  Future<ApiResult<String>> getUserName()async{
    return await homeRepo.getCurrentUserName();
  }
  Future<ApiResult<RandomExerciseResponse>> getRandomExercise()async{
    return await homeRepo.getRandomExercises();
  }
  Future<ApiResult<FoodCategoriesResponse>> getMealsCategories()async{
    return await homeRepo.getMealsCategories();
  }
  Future<ApiResult<ExercisesResponse>> getAllExercises()async{
    return await homeRepo.getAllExercises();
  }
   Future<ApiResult<GetAllMusclesGroupsReponse>>  getAllMusclesGroups() async {
    return await getAllMusclesGroupsUseCase.invoke();
  }
  Future<ApiResult<GetAllMusclesByMuscleGroupIdReponse>>  getWorkoutsExercise(String id) async {
    return await getAllMusclesByMuscleGroupIdUseCase.invoke(id);
  }

  



}