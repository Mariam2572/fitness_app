// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoriesResponse _$FoodCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => FoodCategoriesResponse(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => FoodCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FoodCategoriesResponseToJson(
  FoodCategoriesResponse instance,
) => <String, dynamic>{'categories': instance.categories};

FoodCategory _$FoodCategoryFromJson(Map<String, dynamic> json) => FoodCategory(
  idCategory: json['idCategory'] as String?,
  strCategory: json['strCategory'] as String?,
  strCategoryThumb: json['strCategoryThumb'] as String?,
  strCategoryDescription: json['strCategoryDescription'] as String?,
);

Map<String, dynamic> _$FoodCategoryToJson(FoodCategory instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
