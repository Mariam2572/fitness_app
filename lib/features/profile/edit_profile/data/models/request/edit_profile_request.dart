import 'package:json_annotation/json_annotation.dart';
part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'age')
  int? age;
  @JsonKey(name: 'goal')
  String? goal;
  @JsonKey(name: 'activityLevel')
  String? activityLevel;

  EditProfileRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  static List<EditProfileRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(EditProfileRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
