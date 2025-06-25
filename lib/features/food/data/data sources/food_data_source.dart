import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';

abstract class FoodRemoteDataSource {
  Future<ApiResult<FoodCategoriesResponse>> getFoodCategories();
  Future<ApiResult<MealsOfCategoryResponse>> getMealsByCategory(
    String category,
  );
}
