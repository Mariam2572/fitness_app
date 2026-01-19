import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/domain/repos/food_repo.dart';

import 'get_food_categories_usecase_test.mocks.dart';

@GenerateMocks([FoodRepo])
void main() {
  late MockFoodRepo mockRepo;
  late GetFoodCategoriesUseCase useCase;

  setUp(() {
    mockRepo = MockFoodRepo();
    useCase = GetFoodCategoriesUseCase(mockRepo);
  });

  group('GetFoodCategoriesUseCase', () {
    final response = FoodCategoriesResponse(categories: []);

    test('should return ApiSuccess<FoodCategoriesResponse>', () async {
      final expected = ApiSuccess<FoodCategoriesResponse>(data: response);
      provideDummy<ApiResult<FoodCategoriesResponse>>(expected);

      when(mockRepo.getFoodCategories()).thenAnswer((_) async => expected);

      final actual = await useCase.invoke();

      verify(mockRepo.getFoodCategories()).called(1);
      expect(actual, expected);
    });

    test('should return ApiError<FoodCategoriesResponse>', () async {
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

      when(mockRepo.getFoodCategories()).thenAnswer((_) async => expected);

      final actual = await useCase.invoke();

      verify(mockRepo.getFoodCategories()).called(1);
      expect(actual, isA<ApiError<FoodCategoriesResponse>>());
    });
  });
}
