// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_of_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsOfCategoryResponse _$MealsOfCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    MealsOfCategoryResponse(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsOfCategoryResponseToJson(
        MealsOfCategoryResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      name: json['strMeal'] as String?,
      thumbnail: json['strMealThumb'] as String?,
      id: json['idMeal'] as String?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'strMeal': instance.name,
      'strMealThumb': instance.thumbnail,
      'idMeal': instance.id,
    };
