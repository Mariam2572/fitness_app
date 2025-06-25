import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class MealDetails {
  String? idMeal;
  String? strMeal;
  dynamic strMealAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  dynamic strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;

  MealDetails({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) => _$MealDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MealDetails) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      idMeal.hashCode ^
      strMeal.hashCode ^
      strMealAlternate.hashCode ^
      strCategory.hashCode ^
      strArea.hashCode ^
      strInstructions.hashCode ^
      strMealThumb.hashCode ^
      strTags.hashCode ^
      strYoutube.hashCode ^
      strIngredient1.hashCode ^
      strIngredient2.hashCode ^
      strIngredient3.hashCode ^
      strIngredient4.hashCode ^
      strIngredient5.hashCode ^
      strIngredient6.hashCode ^
      strIngredient7.hashCode ^
      strIngredient8.hashCode ^
      strIngredient9.hashCode ^
      strIngredient10.hashCode ^
      strIngredient11.hashCode ^
      strIngredient12.hashCode ^
      strIngredient13.hashCode ^
      strIngredient14.hashCode ^
      strIngredient15.hashCode ^
      strIngredient16.hashCode ^
      strIngredient17.hashCode ^
      strIngredient18.hashCode ^
      strIngredient19.hashCode ^
      strIngredient20.hashCode ^
      strMeasure1.hashCode ^
      strMeasure2.hashCode ^
      strMeasure3.hashCode ^
      strMeasure4.hashCode ^
      strMeasure5.hashCode ^
      strMeasure6.hashCode ^
      strMeasure7.hashCode ^
      strMeasure8.hashCode ^
      strMeasure9.hashCode ^
      strMeasure10.hashCode ^
      strMeasure11.hashCode ^
      strMeasure12.hashCode ^
      strMeasure13.hashCode ^
      strMeasure14.hashCode ^
      strMeasure15.hashCode ^
      strMeasure16.hashCode ^
      strMeasure17.hashCode ^
      strMeasure18.hashCode ^
      strMeasure19.hashCode ^
      strMeasure20.hashCode ^
      strSource.hashCode ^
      strImageSource.hashCode ^
      strCreativeCommonsConfirmed.hashCode ^
      dateModified.hashCode;
}
