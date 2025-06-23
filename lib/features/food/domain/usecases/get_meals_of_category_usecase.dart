import 'package:fitness_app/features/food/domain/repos/food_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';

@injectable
class GetMealsByCategoryUseCase {
  final FoodRepo foodRepo;

  GetMealsByCategoryUseCase(this.foodRepo);

  Future<ApiResult<MealsOfCategoryResponse>> invoke(String category) async {
    return await foodRepo.getMealsByCategory(category);
  }
}
