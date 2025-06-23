import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_excuter.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/data%20sources/food_data_source.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: FoodRemoteDataSource)
class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final ApiService _apiService;

  FoodRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<FoodCategoriesResponse>> getFoodCategories() async {
    return await apiExecuter<FoodCategoriesResponse>(
      () async => await _apiService.getFoodCategories(),
      '',
    );
  }

  @override
  Future<ApiResult<MealsOfCategoryResponse>> getMealsByCategory(
    String category,
  ) async {
    return await apiExecuter<MealsOfCategoryResponse>(
      () async => await _apiService.getMealsByCategory(category),
      '',
    );
  }
}
