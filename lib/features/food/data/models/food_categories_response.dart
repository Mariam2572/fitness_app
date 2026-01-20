import 'package:json_annotation/json_annotation.dart';

part 'food_categories_response.g.dart';

@JsonSerializable()
class FoodCategoriesResponse {
  @JsonKey(name: 'categories')
  final List<FoodCategory>? categories;

  FoodCategoriesResponse({this.categories});

  factory FoodCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodCategoriesResponseToJson(this);
}

@JsonSerializable()
class FoodCategory {
  @JsonKey(name: 'idCategory')
  final String? idCategory;

  @JsonKey(name: 'strCategory')
  final String? strCategory;

  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;

  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  FoodCategory({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$FoodCategoryToJson(this);
}
