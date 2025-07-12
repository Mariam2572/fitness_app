// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_datails_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsDatailsResponse _$MealsDatailsResponseFromJson(
        Map<String, dynamic> json) =>
    MealsDatailsResponse(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsDatailsResponseToJson(
        MealsDatailsResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };
