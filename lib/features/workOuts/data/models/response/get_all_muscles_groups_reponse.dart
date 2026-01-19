import 'package:json_annotation/json_annotation.dart';

part 'get_all_muscles_groups_reponse.g.dart';

@JsonSerializable()
class GetAllMusclesGroupsReponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'musclesGroup')
  List<MusclesGroupBean>? musclesGroup;

  GetAllMusclesGroupsReponse({this.message, this.musclesGroup});

  factory GetAllMusclesGroupsReponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllMusclesGroupsReponseFromJson(json);

  static List<GetAllMusclesGroupsReponse> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(GetAllMusclesGroupsReponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$GetAllMusclesGroupsReponseToJson(this);
}

@JsonSerializable()
class MusclesGroupBean {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  MusclesGroupBean({this.id, this.name});

  factory MusclesGroupBean.fromJson(Map<String, dynamic> json) =>
      _$MusclesGroupBeanFromJson(json);

  static List<MusclesGroupBean> fromList(List<Map<String, dynamic>> list) {
    return list.map(MusclesGroupBean.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$MusclesGroupBeanToJson(this);
}
