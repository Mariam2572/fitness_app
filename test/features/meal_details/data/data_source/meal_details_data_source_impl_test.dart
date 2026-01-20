import 'package:fitness_app/core/base/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/features/foodDetails/data/data_source/meals_details_remote_data_source_imp.dart';
import 'package:fitness_app/features/foodDetails/data/data_source/meals_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/core/api_manager/api_services.dart';

import 'meal_details_data_source_impl_test.mocks.dart';

@GenerateMocks([MealApiService])
void main() {
  late MockMealApiService mockMealApiService;
  late MealsDetailsRemoteDataSource dataSource;

  setUp(() {
    mockMealApiService = MockMealApiService();
    dataSource = MealsDetailsRemoteDataSourceImp(
      apiService: mockMealApiService,
    );
  });

  group('MealsDetailsRemoteDataSourceImp Tests', () {
    final meal = MealDetails(idMeal: '1');
    final response = MealsDatailsResponse(meals: [meal]);

    test('should return ApiSuccess when API call is successful', () async {
      // arrange
      when(
        mockMealApiService.getMealsDetails('1'),
      ).thenAnswer((_) async => response);

      // act
      final result = await dataSource.mealsDatails(id: '1');

      // assert
      expect(result, isA<ApiSuccess<MealsDatailsResponse>>());
      expect((result as ApiSuccess).data, equals(response));
      verify(mockMealApiService.getMealsDetails('1')).called(1);
    });

    test('should return ApiError when API call throws an exception', () async {
      // arrange
      when(
        mockMealApiService.getMealsDetails('1'),
      ).thenThrow(Exception('Failed to load meal'));

      // act
      final result = await dataSource.mealsDatails(id: '1');

      // assert
      expect(result, isA<ApiError<MealsDatailsResponse>>());
      expect(result, isA<ApiError<MealsDatailsResponse>>());
      verify(mockMealApiService.getMealsDetails('1')).called(1);
    });
  });
}
