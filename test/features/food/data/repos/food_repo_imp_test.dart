import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/food/data/data%20sources/food_data_source.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/repos/food_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/food/data/repos/food_repo_imp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_repo_imp_test.mocks.dart';

@GenerateMocks([FoodRemoteDataSource])
void main() {
  late FoodRepo repo;
  late MockFoodRemoteDataSource mockFoodDataSource;

  setUp(() {
    mockFoodDataSource = MockFoodRemoteDataSource();
    repo = FoodRepoImpl(mockFoodDataSource);
  });
  group("this gorup for testing the method inside the food repo", () {
    final response = FoodCategoriesResponse(categories: []);

    test('this test should return ApiSuccess from data source', () async {
      final expected = ApiSuccess<FoodCategoriesResponse>(data: response);
      provideDummy<ApiResult<FoodCategoriesResponse>>(expected);

      when(
        mockFoodDataSource.getFoodCategories(),
      ).thenAnswer((_) async => expected);
      final actual = await repo.getFoodCategories();

      verify(mockFoodDataSource.getFoodCategories()).called(1);
      expect(actual, equals(expected));
    });
    test('should return ApiError when data source fails', () async {
      final expected = ApiError<FoodCategoriesResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
      provideDummy<ApiResult<FoodCategoriesResponse>>(
        ApiError<FoodCategoriesResponse>(
          message: '',
          failure: ServerFailure(errorMessage: ''),
        ),
      );

      when(
        mockFoodDataSource.getFoodCategories(),
      ).thenAnswer((_) async => expected);

      final actual = await repo.getFoodCategories();

      verify(mockFoodDataSource.getFoodCategories()).called(1);
      expect(actual, equals(expected));
    });
  });

  group('FoodRepoImpl - getMealsByCategory', () {
    const category = 'Seafood';
    final response = MealsOfCategoryResponse(meals: []);

    test('should return ApiSuccess from data source', () async {
      final expected = ApiSuccess<MealsOfCategoryResponse>(data: response);
      provideDummy<ApiResult<MealsOfCategoryResponse>>(expected);

      when(
        mockFoodDataSource.getMealsByCategory(category),
      ).thenAnswer((_) async => expected);

      final actual = await repo.getMealsByCategory(category);

      verify(mockFoodDataSource.getMealsByCategory(category)).called(1);
      expect(actual, equals(expected));
    });

    test('should return ApiError when data source fails', () async {
      final expected = ApiError<MealsOfCategoryResponse>(
        message: 'Server failed',
        failure: ServerFailure(errorMessage: 'Server failed'),
      );
      provideDummy<ApiResult<MealsOfCategoryResponse>>(
        ApiError<MealsOfCategoryResponse>(
          message: '',
          failure: ServerFailure(errorMessage: ''),
        ),
      );

      when(
        mockFoodDataSource.getMealsByCategory(category),
      ).thenAnswer((_) async => expected);

      final actual = await repo.getMealsByCategory(category);

      verify(mockFoodDataSource.getMealsByCategory(category)).called(1);
      expect(actual, equals(expected));
    });
  });
}
