import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/repos/food_repo.dart';

import 'get_food_categories_usecase_test.mocks.dart';

@GenerateMocks([FoodRepo])
void main() {
  late MockFoodRepo mockRepo;
  late GetMealsByCategoryUseCase useCase;
  final response = MealsOfCategoryResponse(meals: []);
  const category = 'Seafood';

  setUp(() {
    mockRepo = MockFoodRepo();
    useCase = GetMealsByCategoryUseCase(mockRepo);
  });

  group('GetMealsByCategoryUseCase', () {
    test('should return ApiSuccess<MealsOfCategoryResponse>', () async {
      final expected = ApiSuccess<MealsOfCategoryResponse>(data: response);
      provideDummy<ApiResult<MealsOfCategoryResponse>>(expected);

      when(
        mockRepo.getMealsByCategory(category),
      ).thenAnswer((_) async => expected);

      final actual = await useCase.invoke(category);

      verify(mockRepo.getMealsByCategory(category)).called(1);
      expect(actual, expected);
    });

    test('should return ApiError<MealsOfCategoryResponse>', () async {
      final expected = ApiError<MealsOfCategoryResponse>(
        message: 'Network error',
        failure: ServerFailure(errorMessage: 'Network error'),
      );
      provideDummy<ApiResult<MealsOfCategoryResponse>>(
        ApiError<MealsOfCategoryResponse>(
          message: '',
          failure: ServerFailure(errorMessage: ''),
        ),
      );

      when(
        mockRepo.getMealsByCategory(category),
      ).thenAnswer((_) async => expected);

      final actual = await useCase.invoke(category);

      verify(mockRepo.getMealsByCategory(category)).called(1);
      expect(actual, isA<ApiError<MealsOfCategoryResponse>>());
    });
  });
}
