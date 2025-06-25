// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_muscles_groups_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMusclesGroupsReponse _$GetAllMusclesGroupsReponseFromJson(
  Map<String, dynamic> json,
) => GetAllMusclesGroupsReponse(
  message: json['message'] as String?,
  musclesGroup:
      (json['musclesGroup'] as List<dynamic>?)
          ?.map((e) => MusclesGroupBean.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetAllMusclesGroupsReponseToJson(
  GetAllMusclesGroupsReponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'musclesGroup': instance.musclesGroup,
};

MusclesGroupBean _$MusclesGroupBeanFromJson(Map<String, dynamic> json) =>
    MusclesGroupBean(id: json['_id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$MusclesGroupBeanToJson(MusclesGroupBean instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};
