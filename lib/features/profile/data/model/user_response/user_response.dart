import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:fitness_app/features/profile/data/model/user_response/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String? message;
  User? user;

  UserResponse({this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode;
}
