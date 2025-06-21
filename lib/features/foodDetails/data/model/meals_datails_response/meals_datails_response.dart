import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';

part 'meals_datails_response.g.dart';

@JsonSerializable()
class MealsDatailsResponse {
  List<Meal>? meals;

  MealsDatailsResponse({this.meals});

  factory MealsDatailsResponse.fromJson(Map<String, dynamic> json) {
    return _$MealsDatailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MealsDatailsResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MealsDatailsResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => meals.hashCode;
}
