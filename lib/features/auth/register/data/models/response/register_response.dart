import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'token')
  String? token;

  RegisterResponse({this.message, this.user, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  static List<RegisterResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'age')
  int? age;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'activityLevel')
  String? activityLevel;
  @JsonKey(name: 'goal')
  String? goal;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'createdAt')
  String? createdAt;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
