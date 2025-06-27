import 'package:json_annotation/json_annotation.dart';

part 'get_user_data_reponse.g.dart';

@JsonSerializable()
class GetUserDataReponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'user')
  final UserData? user;

  GetUserDataReponse({this.message, this.user});

  factory GetUserDataReponse.fromJson(Map<String, dynamic> json) => _$GetUserDataReponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDataReponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'age')
  final int? age;

  @JsonKey(name: 'weight')
  final int? weight;

  @JsonKey(name: 'height')
  final int? height;

  @JsonKey(name: 'activityLevel')
  final String? activityLevel;

  @JsonKey(name: 'goal')
  final String? goal;

  @JsonKey(name: 'photo')
  final String? photo;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'passwordResetCode')
  final String? passwordResetCode;

  @JsonKey(name: 'passwordResetExpires')
  final String? passwordResetExpires;

  @JsonKey(name: 'resetCodeVerified')
  final bool? resetCodeVerified;

  UserData({
    this.id,
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
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
