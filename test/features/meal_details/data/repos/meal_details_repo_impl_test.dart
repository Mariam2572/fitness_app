import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/foodDetails/data/data_source/meals_details_remote_data_source.dart';
import 'package:fitness_app/features/foodDetails/data/repository_implementation/meals_details_repository_implementation.dart';

import 'meal_details_repo_impl_test.mocks.dart';

@GenerateMocks([MealsDetailsRemoteDataSource])
void main() {
  late MockMealsDetailsRemoteDataSource mockRemoteDataSource;
  late MealsDetailsRepositoryImplementation repository;

  final meal = MealDetails(idMeal: '1');
  final response = MealsDatailsResponse(meals: [meal]);

  setUp(() {
    mockRemoteDataSource = MockMealsDetailsRemoteDataSource();
    repository = MealsDetailsRepositoryImplementation(
      mealsDetailsRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('MealsDetailsRepositoryImplementation', () {
    test('should return ApiSuccess when remote data source returns success', () async {
      final expectedResult = ApiSuccess<MealsDatailsResponse>(data: response);

      // الحل السحري بدون registerFallbackValue
      provideDummy<ApiResult<MealsDatailsResponse>>(expectedResult);

      when(mockRemoteDataSource.mealsDatails(id: '1'))
          .thenAnswer((_) async => expectedResult);

      final actual = await repository.mealsDatails(id: '1');

      verify(mockRemoteDataSource.mealsDatails(id: '1')).called(1);
      expect(actual, expectedResult);
    });

    test('should return ApiError when remote data source fails', () async {
      final expectedError = ApiError<MealsDatailsResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );

      provideDummy<ApiResult<MealsDatailsResponse>>(expectedError);

      when(mockRemoteDataSource.mealsDatails(id: '1'))
          .thenAnswer((_) async => expectedError);

      final actual = await repository.mealsDatails(id: '1');

      verify(mockRemoteDataSource.mealsDatails(id: '1')).called(1);
      expect(actual, expectedError);
    });
  });
}
