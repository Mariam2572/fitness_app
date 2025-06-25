import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meals_datails_response.dart';
import 'package:fitness_app/features/foodDetails/domain/repository_contract/meals_details_contract.dart';
import 'package:fitness_app/features/foodDetails/domain/usecases/meals_details_usecase.dart';

import 'meal_details_use_case_test.mocks.dart';


@GenerateMocks([MealsDetailsContract])
void main() {
  late MockMealsDetailsContract mockRepository;
  late MealsDetailsUsecase useCase;

  final meal = MealDetails(idMeal: '1');
  final response = MealsDatailsResponse(meals: [meal]);

  setUp(() {
    mockRepository = MockMealsDetailsContract();
    useCase = MealsDetailsUsecase(mealsDetailsContract: mockRepository);
  });

  group('MealsDetailsUsecase', () {
    test('should return ApiSuccess when repository returns success', () async {
      final expectedResult = ApiSuccess<MealsDatailsResponse>(data: response);

      provideDummy<ApiResult<MealsDatailsResponse>>(expectedResult);

      when(mockRepository.mealsDatails(id: '1'))
          .thenAnswer((_) async => expectedResult);

      final result = await useCase.invoke(id: '1');

      verify(mockRepository.mealsDatails(id: '1')).called(1);
      expect(result, expectedResult);
    });

    test('should return ApiError when repository returns error', () async {
      final expectedError = ApiError<MealsDatailsResponse>(
        message: 'Failed to fetch meal',
        failure: ServerFailure(errorMessage: 'Failed to fetch meal'),
      );

      provideDummy<ApiResult<MealsDatailsResponse>>(expectedError);

      when(mockRepository.mealsDatails(id: '1'))
          .thenAnswer((_) async => expectedError);

      final result = await useCase.invoke(id: '1');

      verify(mockRepository.mealsDatails(id: '1')).called(1);
      expect(result, expectedError);
    });
  });
}
