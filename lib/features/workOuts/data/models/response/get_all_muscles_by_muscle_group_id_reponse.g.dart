// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_muscles_by_muscle_group_id_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMusclesByMuscleGroupIdReponse
    _$GetAllMusclesByMuscleGroupIdReponseFromJson(Map<String, dynamic> json) =>
        GetAllMusclesByMuscleGroupIdReponse(
          message: json['message'] as String?,
          muscleGroup: json['muscleGroup'] == null
              ? null
              : MuscleGroupBean.fromJson(
                  json['muscleGroup'] as Map<String, dynamic>),
          muscles: (json['muscles'] as List<dynamic>?)
              ?.map((e) => MusclesBean.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetAllMusclesByMuscleGroupIdReponseToJson(
        GetAllMusclesByMuscleGroupIdReponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'muscleGroup': instance.muscleGroup,
      'muscles': instance.muscles,
    };

MuscleGroupBean _$MuscleGroupBeanFromJson(Map<String, dynamic> json) =>
    MuscleGroupBean(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MuscleGroupBeanToJson(MuscleGroupBean instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

MusclesBean _$MusclesBeanFromJson(Map<String, dynamic> json) => MusclesBean(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MusclesBeanToJson(MusclesBean instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
