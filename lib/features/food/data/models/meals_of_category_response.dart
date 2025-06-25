import 'package:json_annotation/json_annotation.dart';

part 'meals_of_category_response.g.dart';

@JsonSerializable()
class MealsOfCategoryResponse {
  @JsonKey(name: 'meals')
  final List<Meal>? meals;

  MealsOfCategoryResponse({this.meals});

  factory MealsOfCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsOfCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsOfCategoryResponseToJson(this);
}

@JsonSerializable()
class Meal {
  @JsonKey(name: 'strMeal')
  final String? name;

  @JsonKey(name: 'strMealThumb')
  final String? thumbnail;

  @JsonKey(name: 'idMeal')
  final String? id;

  Meal({this.name, this.thumbnail, this.id});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
