import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

final class FoodCategoriesSuccess extends FoodState {
  final FoodCategoriesResponse response;
  const FoodCategoriesSuccess(this.response);

  @override
  List<Object> get props => [response];
}

final class MealsByCategorySuccess extends FoodState {
  final MealsOfCategoryResponse response;
  const MealsByCategorySuccess(this.response);

  @override
  List<Object> get props => [response];
}

final class FoodFailure extends FoodState {
  final String error;
  const FoodFailure(this.error);

  @override
  List<Object> get props => [error];
}
