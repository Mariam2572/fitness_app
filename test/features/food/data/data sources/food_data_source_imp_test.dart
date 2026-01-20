import 'package:fitness_app/core/api_manager/api_services.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/data%20sources/food_data_source_imp.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_data_source_imp_test.mocks.dart';

@GenerateMocks([MealApiService])
void main() {
  late MockMealApiService mockApiService;
  late FoodRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiService = MockMealApiService();
    dataSource = FoodRemoteDataSourceImpl(mockApiService);
  });

  group('FoodDataSourceImpl', () {
    test('should return success ApiResult for getFoodCategories', () async {
      final response = FoodCategoriesResponse(categories: []);

      when(
        mockApiService.getFoodCategories(),
      ).thenAnswer((_) async => response);

      final result = await dataSource.getFoodCategories();

      expect(result, isA<ApiSuccess<FoodCategoriesResponse>>());
      expect((result as ApiSuccess).data, equals(response));
      verify(mockApiService.getFoodCategories()).called(1);
    });

    test(
      'should return error ApiResult for getFoodCategories when fails',
      () async {
        when(mockApiService.getFoodCategories()).thenThrow(Exception('Failed'));

        final result = await dataSource.getFoodCategories();

        expect(result, isA<ApiError<FoodCategoriesResponse>>());
        verify(mockApiService.getFoodCategories()).called(1);
      },
    );

    test('should return success ApiResult for getMealsByCategory', () async {
      const category = 'Seafood';
      final response = MealsOfCategoryResponse(meals: []);

      when(
        mockApiService.getMealsByCategory(category),
      ).thenAnswer((_) async => response);

      final result = await dataSource.getMealsByCategory(category);

      expect(result, isA<ApiSuccess<MealsOfCategoryResponse>>());
      expect((result as ApiSuccess).data, equals(response));
      verify(mockApiService.getMealsByCategory(category)).called(1);
    });

    test(
      'should return error ApiResult for getMealsByCategory when fails',
      () async {
        const category = 'Seafood';

        when(
          mockApiService.getMealsByCategory(category),
        ).thenThrow(Exception('Failed'));

        final result = await dataSource.getMealsByCategory(category);

        expect(result, isA<ApiError<MealsOfCategoryResponse>>());
        verify(mockApiService.getMealsByCategory(category)).called(1);
      },
    );
  });
}
