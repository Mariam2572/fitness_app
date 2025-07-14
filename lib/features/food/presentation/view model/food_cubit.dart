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
List<FoodCategory> tabs = [];
  FoodCubit(this.getCategoriesUseCase, this.getMealsUseCase)
    : super(FoodInitial());

  Future<void> doIntent(FoodIntent intent) async {
    switch (intent) {
      case LoadFoodCategoriesIntent():
      await  _getCategories();
        break;
      case LoadMealsByCategoryIntent():
      await  _getMeals(intent.category);
        break;
    }
  }

  Future<void> _getCategories() async {
    emit(FoodLoading());
    final result = await getCategoriesUseCase.invoke();
    if (result is ApiSuccess<FoodCategoriesResponse>) {
        tabs = result.data?.categories ?? [];
        emit(FoodCategoriesSuccess(result.data!));

    } else if( result is ApiError<FoodCategoriesResponse>) {
        emit(FoodFailure(result.failure?.errorMessage ?? 'Error occurred'));
    } else {
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
