import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/Error/error_handler.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_cubit_test.mocks.dart';

@GenerateMocks([GetFoodCategoriesUseCase, GetMealsByCategoryUseCase])
void main() {
  late FoodCubit cubit;
  late MockGetFoodCategoriesUseCase mockCategoriesUseCase;
  late MockGetMealsByCategoryUseCase mockMealsUseCase;

  setUp(() {
    mockCategoriesUseCase = MockGetFoodCategoriesUseCase();
    mockMealsUseCase = MockGetMealsByCategoryUseCase();
    cubit = FoodCubit(mockCategoriesUseCase, mockMealsUseCase);
  });

  group('FoodCubit - LoadFoodCategoriesIntent', () {
    final response = FoodCategoriesResponse(categories: []);
    final success = ApiSuccess<FoodCategoriesResponse>(data: response);
    final error = ApiError<FoodCategoriesResponse>(
      failure: ServerFailure(errorMessage: 'Failed to fetch categories'),
    );

    blocTest<FoodCubit, FoodState>(
      'emits [FoodLoading, FoodCategoriesSuccess] on success',
      build: () {
        provideDummy<ApiResult<FoodCategoriesResponse>>(success);
        when(mockCategoriesUseCase.invoke()).thenAnswer((_) async => success);
        return cubit;
      },
      act: (cubit) => cubit.doIntent(LoadFoodCategoriesIntent()),
      expect: () => [FoodLoading(), FoodCategoriesSuccess(response)],
      verify: (_) {
        verify(mockCategoriesUseCase.invoke()).called(1);
      },
    );

    blocTest<FoodCubit, FoodState>(
      'emits [FoodLoading, FoodFailure] on error',
      build: () {
        provideDummy<ApiResult<FoodCategoriesResponse>>(error);
        when(mockCategoriesUseCase.invoke()).thenAnswer((_) async => error);
        return cubit;
      },
      act: (cubit) => cubit.doIntent(LoadFoodCategoriesIntent()),
      expect:
          () => [
            FoodLoading(),
            const FoodFailure('Failed to fetch categories'),
          ],
      verify: (_) {
        verify(mockCategoriesUseCase.invoke()).called(1);
      },
    );
  });

  group('FoodCubit - LoadMealsByCategoryIntent', () {
    const category = 'Seafood';
    final response = MealsOfCategoryResponse(meals: []);
    final success = ApiSuccess<MealsOfCategoryResponse>(data: response);
    final error = ApiError<MealsOfCategoryResponse>(
      failure: ServerFailure(errorMessage: 'Failed to fetch meals'),
    );

    blocTest<FoodCubit, FoodState>(
      'emits [FoodLoading, MealsByCategorySuccess] on success',
      build: () {
        provideDummy<ApiResult<MealsOfCategoryResponse>>(success);
        when(
          mockMealsUseCase.invoke(category),
        ).thenAnswer((_) async => success);
        return cubit;
      },
      act:
          (cubit) =>
              cubit.doIntent(LoadMealsByCategoryIntent(category: category)),
      expect: () => [FoodLoading(), MealsByCategorySuccess(response)],
      verify: (_) {
        verify(mockMealsUseCase.invoke(category)).called(1);
      },
    );

    blocTest<FoodCubit, FoodState>(
      'emits [FoodLoading, FoodFailure] on error',
      build: () {
        provideDummy<ApiResult<MealsOfCategoryResponse>>(error);
        when(mockMealsUseCase.invoke(category)).thenAnswer((_) async => error);
        return cubit;
      },
      act:
          (cubit) =>
              cubit.doIntent(LoadMealsByCategoryIntent(category: category)),
      expect: () => [FoodLoading(), const FoodFailure('Failed to fetch meals')],
      verify: (_) {
        verify(mockMealsUseCase.invoke(category)).called(1);
      },
    );
  });
}
