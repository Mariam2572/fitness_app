// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_data_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDataReponse _$GetUserDataReponseFromJson(Map<String, dynamic> json) =>
    GetUserDataReponse(
      message: json['message'] as String?,
      user:
          json['user'] == null
              ? null
              : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDataReponseToJson(GetUserDataReponse instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: json['_id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  age: (json['age'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  activityLevel: json['activityLevel'] as String?,
  goal: json['goal'] as String?,
  photo: json['photo'] as String?,
  createdAt: json['createdAt'] as String?,
  passwordResetCode: json['passwordResetCode'] as String?,
  passwordResetExpires: json['passwordResetExpires'] as String?,
  resetCodeVerified: json['resetCodeVerified'] as bool?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'age': instance.age,
  'weight': instance.weight,
  'height': instance.height,
  'activityLevel': instance.activityLevel,
  'goal': instance.goal,
  'photo': instance.photo,
  'createdAt': instance.createdAt,
  'passwordResetCode': instance.passwordResetCode,
  'passwordResetExpires': instance.passwordResetExpires,
  'resetCodeVerified': instance.resetCodeVerified,
};
