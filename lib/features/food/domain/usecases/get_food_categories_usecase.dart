import 'package:fitness_app/features/food/domain/repos/food_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';

@injectable
class GetFoodCategoriesUseCase {
  final FoodRepo foodRepo;

  GetFoodCategoriesUseCase(this.foodRepo);

  Future<ApiResult<FoodCategoriesResponse>> invoke() async {
    return await foodRepo.getFoodCategories();
  }
}
