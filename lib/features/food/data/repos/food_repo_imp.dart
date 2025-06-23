import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/data%20sources/food_data_source.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/repos/food_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRepo)
class FoodRepoImpl implements FoodRepo {
  final FoodRemoteDataSource remoteDataSource;

  FoodRepoImpl(this.remoteDataSource);

  @override
  Future<ApiResult<FoodCategoriesResponse>> getFoodCategories() async {
    return await remoteDataSource.getFoodCategories();
  }

  @override
  Future<ApiResult<MealsOfCategoryResponse>> getMealsByCategory(
    String category,
  ) async {
    return await remoteDataSource.getMealsByCategory(category);
  }
}
