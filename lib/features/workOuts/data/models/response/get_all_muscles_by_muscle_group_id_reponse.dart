import 'package:json_annotation/json_annotation.dart';

part 'get_all_muscles_by_muscle_group_id_reponse.g.dart';

@JsonSerializable()
class GetAllMusclesByMuscleGroupIdReponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'muscleGroup')
  MuscleGroupBean? muscleGroup;

  @JsonKey(name: 'muscles')
  List<MusclesBean>? muscles;

  GetAllMusclesByMuscleGroupIdReponse({this.message, this.muscleGroup, this.muscles});

  factory GetAllMusclesByMuscleGroupIdReponse.fromJson(Map<String, dynamic> json) => _$GetAllMusclesByMuscleGroupIdReponseFromJson(json);

  static List<GetAllMusclesByMuscleGroupIdReponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetAllMusclesByMuscleGroupIdReponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$GetAllMusclesByMuscleGroupIdReponseToJson(this);
}

@JsonSerializable()
class MuscleGroupBean {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  MuscleGroupBean({this.id, this.name});

  factory MuscleGroupBean.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupBeanFromJson(json);

  static List<MuscleGroupBean> fromList(List<Map<String, dynamic>> list) {
    return list.map(MuscleGroupBean.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$MuscleGroupBeanToJson(this);
}

@JsonSerializable()
class MusclesBean {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'image')
  String? image;

  MusclesBean({this.id, this.name, this.image});

  factory MusclesBean.fromJson(Map<String, dynamic> json) =>
      _$MusclesBeanFromJson(json);

  static List<MusclesBean> fromList(List<Map<String, dynamic>> list) {
    return list.map(MusclesBean.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$MusclesBeanToJson(this);
}
