import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'rePassword')
  String? rePassword;
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

  RegisterRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  static List<RegisterRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
