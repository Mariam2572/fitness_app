import 'package:json_annotation/json_annotation.dart';
part 'levels_by_muscles_model.g.dart';

@JsonSerializable()
class LevelsByMusclesModel {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'totalLevels')
  int? totalLevels;
  @JsonKey(name: 'difficulty_levels')
  List<DifficultyLevels>? difficultyLevels;

  LevelsByMusclesModel({this.message, this.totalLevels, this.difficultyLevels});

  factory LevelsByMusclesModel.fromJson(Map<String, dynamic> json) =>
      _$LevelsByMusclesModelFromJson(json);

  static List<LevelsByMusclesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(LevelsByMusclesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$LevelsByMusclesModelToJson(this);
}

@JsonSerializable()
class DifficultyLevels {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;

  DifficultyLevels({this.id, this.name});

  factory DifficultyLevels.fromJson(Map<String, dynamic> json) =>
      _$DifficultyLevelsFromJson(json);

  static List<DifficultyLevels> fromList(List<Map<String, dynamic>> list) {
    return list.map(DifficultyLevels.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$DifficultyLevelsToJson(this);
}
