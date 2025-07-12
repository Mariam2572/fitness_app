import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';

class FoodCubit extends Cubit<FoodState> {
  final GetFoodCategoriesUseCase getCategoriesUseCase;
  final GetMealsByCategoryUseCase getMealsUseCase;

  FoodCubit(this.getCategoriesUseCase, this.getMealsUseCase)
    : super(FoodInitial());

  void doIntent(FoodIntent intent) {
    switch (intent) {
      case LoadFoodCategoriesIntent():
        _getCategories();
        break;
      case LoadMealsByCategoryIntent():
        _getMeals(intent.category);
        break;
    }
  }

  Future<void> _getCategories() async {
    emit(FoodLoading());
    final result = await getCategoriesUseCase.invoke();
    switch (result) {
      case ApiSuccess<FoodCategoriesResponse>():
        emit(FoodCategoriesSuccess(result.data!));
        break;
      case ApiError<FoodCategoriesResponse>():
        emit(FoodFailure(result.failure?.errorMessage ?? 'Error occurred'));
        break;
      default:
        emit(const FoodFailure('Unknown error'));
    }
  }

  Future<void> _getMeals(String category) async {
    emit(FoodLoading());
    final result = await getMealsUseCase.invoke(category);
    switch (result) {
      case ApiSuccess<MealsOfCategoryResponse>():
        emit(MealsByCategorySuccess(result.data!));
        break;
      case ApiError<MealsOfCategoryResponse>():
        emit(FoodFailure(result.failure?.errorMessage ?? 'Error occurred'));
        break;
      default:
        emit(const FoodFailure('Unknown error'));
    }
  }
}

sealed class FoodIntent {}

class LoadFoodCategoriesIntent extends FoodIntent {}

class LoadMealsByCategoryIntent extends FoodIntent {
  final String category;
  LoadMealsByCategoryIntent({required this.category});
}
