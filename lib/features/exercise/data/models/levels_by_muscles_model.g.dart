// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels_by_muscles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelsByMusclesModel _$LevelsByMusclesModelFromJson(
        Map<String, dynamic> json) =>
    LevelsByMusclesModel(
      message: json['message'] as String?,
      totalLevels: (json['totalLevels'] as num?)?.toInt(),
      difficultyLevels: (json['difficulty_levels'] as List<dynamic>?)
          ?.map((e) => DifficultyLevels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelsByMusclesModelToJson(
        LevelsByMusclesModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'totalLevels': instance.totalLevels,
      'difficulty_levels': instance.difficultyLevels,
    };

DifficultyLevels _$DifficultyLevelsFromJson(Map<String, dynamic> json) =>
    DifficultyLevels(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DifficultyLevelsToJson(DifficultyLevels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
